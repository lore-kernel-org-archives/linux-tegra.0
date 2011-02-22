From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Patches for 2.6.39 merge window
Date: Tue, 22 Feb 2011 13:01:23 -0800
Message-ID: <AANLkTi=Er0pL-KcSqw1WwKy+CZeM9SWjmOkp08YkhKmQ@mail.gmail.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
	<20110222205210.GF31611@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110222205210.GF31611-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 12:52 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Tue, Feb 22, 2011 at 12:48:46PM -0800, Stephen Warren wrote:
>
>> Should we handle it like this: Check in all the platform data to Tegra
>> for-next, but with that one new field removed or commented out. Wait until
>> the merge window is open for 2.6.39 (or 2.6.39-rc1 is released), and hence
>> Tegra for-next/for-linus can merge from Linus' tree to pick up the new
>> wm8903.h, then add or uncomment that one field in the platform data?
>
> That's the standard way of handling this sort of thing - just send the
> patch in a second pull request once the dependencies have all landed.
>

You could also put it in the tegra-arch branch and we could both re-merge it.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
