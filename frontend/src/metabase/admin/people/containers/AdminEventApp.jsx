/* eslint "react/prop-types": "warn" */
import React, { Component } from "react";
import PropTypes from "prop-types";
import AdminLayout from "metabase/components/AdminLayout";

export default class AdminEventApp extends Component {
  static propTypes = {
    children: PropTypes.any,
  };

  render() {
    const { children } = this.props;
    return (
      <AdminLayout>
        {children}
      </AdminLayout>
    );
  }
}
