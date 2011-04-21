From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Tegra: select MACH_HAS_SND_SOC_TEGRA_WM8903
Date: Thu, 21 Apr 2011 19:42:44 +0100
Message-ID: <20110421184244.GB31850@opensource.wolfsonmicro.com>
References: <1303229881-9054-1-git-send-email-swarren@nvidia.com> <20110421105819.GC11788@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF04973BB834@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04973BB834-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 21, 2011 at 09:29:30AM -0700, Stephen Warren wrote:

> It didn't matter which way around it was. However, thinking more I was
> indeed wrong, since the conflicts in the initial application were more
> complex than I'd thought through.

It's not that they were complex, it's more that if you've got a patch
which is advertised as being for a particular branch the general
expectation is that it would actually apply to that branch.

> I guess the correct solution would have been for a clean application
> to your tegra branch, then you'd be OK with the merge conflict into
> 2.6.40? I probably should have mentioned it in the patch either way.

Yes, ideally you'd also show the merge result (and possibly even publish
versions of both branches after application, especially if the merge is
tricky).
