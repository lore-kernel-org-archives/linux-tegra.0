From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v9 0/2] Silence missing-graph error for DRM bridges
Date: Wed,  1 Jul 2020 05:16:15 +0300
Message-ID: <20200701021617.12030-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi!

This small series improves DRM bridges code by silencing a noisy error
coming from of-graph code for the device-trees that are missing a
display bridge graph.

  graph: no port node found in ...

One example where this error happens is an older bridge-less DTB used
in conjunction with a newer kernel which has a display controller driver
that supports DRM bridges.

Changelog:

v9: - These two patches are factored out from [1] in order to ease applying
      of the patches.

    - The of_graph_presents() is renamed to of_graph_is_present() like it
      was requested by Rob Herring in the review comment to [1].

    - Added Rob's r-b.

    [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=184102

Dmitry Osipenko (2):
  of_graph: add of_graph_is_present()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

 drivers/gpu/drm/drm_of.c |  9 +++++++
 drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
 include/linux/of_graph.h |  6 +++++
 3 files changed, 58 insertions(+), 9 deletions(-)

-- 
2.26.0
