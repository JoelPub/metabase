import React, { Component } from "react";
import PropTypes from "prop-types";
import { t } from "ttag";
import Event from "metabase/entities/events";
import PaginationControls from "metabase/components/PaginationControls";

@Event.loadList({
  reload: true,
  query: (_, { query }) => ({
    _limit: query.pageSize,
    _page: query.page+1,
  }),
})
export default class EventList extends Component {

  static propTypes = {
    events: PropTypes.array,
  };


  render() {
    const {
      events,
      query,
      onNextPage,
      onPreviousPage,
    } = this.props;
    const { page, pageSize } = query;
    const hasEvents = events.length > 0;

    return (
      <section className="pb4">
        <table className="ContentTable border-bottom">
          <thead>
            <tr>
              <th>{t`Name`}</th>
              <th>{t`Email`}</th>
            </tr>
          </thead>
          <tbody>
            {hasEvents &&
              events.map(event => (
                <tr key={event.id}>
                  <td>
                    <span className="ml2 text-bold">{event.common_name}</span>
                  </td>
                  <td>{event.email}</td>
                </tr>
              ))}
          </tbody>
        </table>

        {hasEvents && (
          <div className="flex align-center justify-between p2">
            <PaginationControls
              page={page}
              pageSize={pageSize}
              itemsLength={events.length}
              onNextPage={onNextPage}
              onPreviousPage={onPreviousPage}
            />
          </div>
        )}
      </section>
    );
  }
}
