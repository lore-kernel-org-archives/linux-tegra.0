From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 00/12] drm/nouveau: support for GK20A, cont'd
Date: Mon, 24 Mar 2014 14:19:51 +0100
Message-ID: <1395667191.5062.18.camel@weser.hi.pengutronix.de>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, gnurou@gmail.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Alexandre,

Am Montag, den 24.03.2014, 17:42 +0900 schrieb Alexandre Courbot:
> Hi everyone,
[...]
> 
> A few lines of hacks (not included here) are still needed to deal with cached
> mappings triggering external aborts and CPU/GPU memory coherency issues, but I
> hope to understand and address these issues next.

For the coherency issue part you may want to look at my Nouveau on ARM
series. Most of it never made it upstream, as I lacked the time to work
further on this, but it solves the coherency issue from the kernel.

It does so by doing the necessary manual cache flushes/invalidates on
buffer access, so costs some performance. To avoid this you really want
to get writecombined mappings into the kernel<->userspace interface.
Simply mapping the pushbuf as WC/US has brought a 7% performance
increase in OpenArena when I last tested this. This test was done with
only one PCIe lane, so the perf increase may be even better with a more
adequate interconnect.

Regards,
Lucas
-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
