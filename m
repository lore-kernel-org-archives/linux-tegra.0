From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Tegra124 clock patches for 3.13?
Date: Wed, 06 Nov 2013 17:11:10 -0700
Message-ID: <527ADA9E.50202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike,

I noticed you pulled the Tegra124 clock patches out of your for-next
tree. Was that a temporary measure to fix up linux-next while you were
at conferences, or was it permanently dropped for 3.13? Peter's updated
"-0" pull request fixed the issues I'm aware of.

Anyway, I guess either way is fine, but I'd like to know for planning
purposes; I want to implement a driver for
include/linux/reset-controller.h for 3.14, and that will depend on those
patches since it's implemented in the clock driver, the reset bits being
part of the clock HW module.

Thanks.
