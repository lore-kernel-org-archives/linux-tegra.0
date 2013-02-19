From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 00/12] Tegra114 clockframework
Date: Tue, 19 Feb 2013 11:39:35 -0700
Message-ID: <5123C6E7.9070407@wwwdotorg.org>
References: <1360931849-7090-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360931849-7090-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/15/2013 05:36 AM, Peter De Schrijver wrote:
> This is the seventh version of the Tegra114 clockframework. It is based on the
> for-next branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git and
> http://www.spinics.net/lists/arm-kernel/msg220452.html.

Mike,

I think it'd be prudent to take this series through the Tegra tree again
for 3.10; patch 11 needs to go in as part of the series due to internal
dependencies, and I'm slightly worried that other Tegra DT changes might
conflict with that patch (if only for context). Taking this series (and
any other Tegra clk driver changes for 3.10) through the Tegra tree
could resolve that easily. Do you have a problem with that?

If that's OK, can you stage the dependency Peter mentioned:
http://www.spinics.net/lists/arm-kernel/msg220452.html
into a stable branch for me to merge, obviously after 3.9-rc1 is out.

Thanks.

Prashant, could you provide a review/ack for this series too.
