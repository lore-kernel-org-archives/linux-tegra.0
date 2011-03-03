From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Patches for 2.6.39 merge window
Date: Thu, 3 Mar 2011 13:37:20 -0800
Message-ID: <AANLkTikMmoBT3ZG2UPNretXDK+UqMyk6X2GEpwMt5SC8@mail.gmail.com>
References: <AANLkTinK4oCbvDNPDFUjpB8qTBZiWfx3CkUuyuTLyVsx@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF03112A5AE2@HQMAIL01.nvidia.com>
	<20110222205210.GF31611@opensource.wolfsonmicro.com>
	<AANLkTi=Er0pL-KcSqw1WwKy+CZeM9SWjmOkp08YkhKmQ@mail.gmail.com>
	<20110222210925.GH31611@opensource.wolfsonmicro.com>
	<AANLkTi=HBjhdSY_7nfeqFZ6Cd_pJA6VBRTaOjmpA3jaw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF045687B480@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF045687B480-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

(resending as plain text)

To prevent the merge window from becoming a mess, patches are supposed
to be in linux-next by rc6 of the previous release.

Ben never responded to my question about merging i2c-tegra, so I'll
merge it for now.

On Thu, Mar 3, 2011 at 11:29 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Thursday, March 03, 2011 12:12 PM:
>>
>> On Tue, Feb 22, 2011 at 1:09 PM, Mark Brown
>> <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
>> > On Tue, Feb 22, 2011 at 01:01:23PM -0800, Colin Cross wrote:
>> >> On Tue, Feb 22, 2011 at 12:52 PM, Mark Brown
>> >
>> >> > That's the standard way of handling this sort of thing - just s=
end
>> the
>> >> > patch in a second pull request once the dependencies have all l=
anded.
>> >
>> >> You could also put it in the tegra-arch branch and we could both =
re-
>> merge it.
>> >
>> > I basically can't rebase my tree - it's merged into Takashi's tree=
 and
>> > there's lots of cross dependencies with my 2.6.38 fixes branch whi=
ch
>> > would cause bisect breakage. =A0If you want to cherry pick the rel=
evant
>> > WM8903 commit over into your tree that'd also be OK by me.
>> >
>>
>> We should be fine with two pull requests. =A0I would still like to g=
et
>> all the changes into the for-next branch, without the wm8903 header
>> change, but with the harmony file that depends on it. =A0I will poin=
t
>> the for-linus branch at the last change that compiles without the
>> wm8903 header change. linux-next should get the ASoC tree and the
>> Tegra for-next tree, so everything should compile there.
>
> OK. I can easily split my patch into two:
> a) Add basically everything, except for the gpio_base WM8903 platform
> =A0 data field. (for-linus)
> b) Add the WM8903 platform data field. (for 2nd pull request)
>
> However, my board patches also rely on I2C platform data. There was
> some discussion that Tegra's for-next would merge in Ben's I2C Tegra
> branch and hence pick up the new platform header from that.
>
> Olof also mentioned he'd submit a patch through his branch to add all
> the I2C bus registrations for all boards once the I2C branch was
> merged.
>
> However, I haven't seen any traction on this. Is this still happening=
?
> If not, I'll have to split my patch slightly differently, to also pul=
l
> out the I2C registrations into the second patch.
>
>> I'm going to be out of the office next week, so this is probably the
>> last chance to get features in 2.6.39.
>
> I'm a little out-of-touch here, but this confuses me; 2.6.38 hasn't
> been released yet, and hence the 2-week merge window isn't open yet.
> And even then, I think we can submit small pull requests for stuff
> like this throughout 2.6.39's rc releases. I'm not why right now is
> the last chance to get stuff in.
>
> --
> nvpublic
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
