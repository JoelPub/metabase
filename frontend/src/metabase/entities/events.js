import { createEntity } from "metabase/lib/entities";

const Events = createEntity({
  name: "events",
  path: "/api/event/list",
});

export default Events;
