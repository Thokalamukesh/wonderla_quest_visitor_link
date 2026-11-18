import { notFound, redirect } from "next/navigation";

export const dynamic = "force-dynamic";

export default function Home() {
  const flutterOrigin = process.env.FLUTTER_WEB_ORIGIN;
  if (!flutterOrigin) notFound();
  redirect(flutterOrigin);
}
