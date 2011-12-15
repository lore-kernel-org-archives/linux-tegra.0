From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v7 00/14] Add support for tegra30 and cardhu
Date: Thu, 15 Dec 2011 10:16:46 -0800
Message-ID: <20111215181646.GA10631@quad.lixom.net>
References: <1323875032-18221-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1323875032-18221-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 14, 2011 at 05:03:12PM +0200, Peter De Schrijver wrote:
> This patchset adds support for the tegra30 SoC and the cardhu development
> board.
> 
> Patchset is on top of linux-next and
> http://www.spinics.net/lists/linux-tegra/msg03016.html.
> 
> Most important changes in v7:
> 
> * split board-dt.c in board-dt-tegra20.c and board-dt-tegra30.c
> * split early init preparation into several patches
> * remove tegra_sdmmc_tap_delay. Drivers should use tegra2_sdmmc_tap_delay as
>   from tegra30 onwards this feature will no longer handled by the clock code
>   as it's implemented in the SDMMC block now.
> * remove CONFIG_CARDHU and the corresponding Kconfig entry

Thanks, this is looking pretty good by now, and remaining rough edges
(if any), can be fixed up over time as well.

I'm ok with it going in but lets have it sit for another day or two until
Stephen is back and has a chance to look it through as well. Colin had
some questions that I want to make sure he's happy with the answers to
as well.


-Olof
