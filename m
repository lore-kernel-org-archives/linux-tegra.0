From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] ARM: Tegra: select MACH_HAS_SND_SOC_TEGRA_WM8903
Date: Thu, 21 Apr 2011 09:29:30 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BB834@HQMAIL01.nvidia.com>
References: <1303229881-9054-1-git-send-email-swarren@nvidia.com>
 <20110421105819.GC11788@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110421105819.GC11788-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Thursday, April 21, 2011 4:58 AM:
> On Tue, Apr 19, 2011 at 10:18:01AM -0600, Stephen Warren wrote:
> > CONFIG_SND_SOC_TEGRA_WM8903 is useful for many Tegra boards. To avoid the
> > ASoC tegra/Kconfig enumerating them all, instead have the Tegra machine
> > Kconfig select MACH_HAS_SND_SOC_TEGRA_WM8903 where appropriate, and have
> > SND_SOC_TEGRA_WM8903 depend on this.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Mark, this will need to be applied to your tegra branch so it can get
> > merged into both trees. Thanks.
> 
> I'm fairly sure it's not been generated against that branch - it doesn't
> apply since the branch doesn't have the rename of the board driver.
> I've fixed this up but please be more careful.

Yes, that patch was against your for-2.6.40 branch.

I'd assumed that since there would either be:

* A conflict applying the patch.
* A smooth merge of tegra into 2.6.40.

Or:

* No conflict applying the patch.
* A merge conflict merging tegra into 2.6.40.

It didn't matter which way around it was. However, thinking more I was
indeed wrong, since the conflicts in the initial application were more
complex than I'd thought through.

I guess the correct solution would have been for a clean application
to your tegra branch, then you'd be OK with the merge conflict into
2.6.40? I probably should have mentioned it in the patch either way.

Hopefully somebody Googling re: how to work cross-subsystem merges will
find these posts and avoid my mistakes.

Thanks for working it out!

-- 
nvpublic
