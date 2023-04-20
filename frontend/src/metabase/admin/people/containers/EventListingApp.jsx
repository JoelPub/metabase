import React from "react";
import PropTypes from "prop-types";
import AdminPaneLayout from "metabase/components/AdminPaneLayout";
import EventList from "../components/EventList";
import { usePeopleQuery } from "../hooks/use-people-query";

const PAGE_SIZE = 2;

export default function EventListingApp({ children }) {
  const {
    query,
    handleNextPage,
    handlePreviousPage,
  } = usePeopleQuery(PAGE_SIZE);

  return (
    <AdminPaneLayout>
      <EventList
        query={query}
        onNextPage={handleNextPage}
        onPreviousPage={handlePreviousPage}/>
      {children}
    </AdminPaneLayout>
  );
}

EventListingApp.propTypes = {
  children: PropTypes.node,
};
