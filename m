From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Patches for 2.6.39 merge window
Date: Thu, 3 Mar 2011 11:12:07 -0800
Message-ID: <AANLkTi=HBjhdSY_7nfeqFZ6Cd_pJA6VBRTaOjmpA3jaw@mail.gmail.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
	<20110222205210.GF31611@opensource.wolfsonmicro.com>
	<AANLkTi=Er0pL-KcSqw1WwKy+CZeM9SWjmOkp08YkhKmQ@mail.gmail.com>
	<20110222210925.GH31611@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110222210925.GH31611-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 1:09 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Tue, Feb 22, 2011 at 01:01:23PM -0800, Colin Cross wrote:
>> On Tue, Feb 22, 2011 at 12:52 PM, Mark Brown
>
>> > That's the standard way of handling this sort of thing - just send=
 the
>> > patch in a second pull request once the dependencies have all land=
ed.
>
>> You could also put it in the tegra-arch branch and we could both re-=
merge it.
>
> I basically can't rebase my tree - it's merged into Takashi's tree an=
d
> there's lots of cross dependencies with my 2.6.38 fixes branch which
> would cause bisect breakage. =A0If you want to cherry pick the releva=
nt
> WM8903 commit over into your tree that'd also be OK by me.
>

We should be fine with two pull requests.  I would still like to get
all the changes into the for-next branch, without the wm8903 header
change, but with the harmony file that depends on it.  I will point
the for-linus branch at the last change that compiles without the
wm8903 header change. linux-next should get the ASoC tree and the
Tegra for-next tree, so everything should compile there.

I'm going to be out of the office next week, so this is probably the
last chance to get features in 2.6.39.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
