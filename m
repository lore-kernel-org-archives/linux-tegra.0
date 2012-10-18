From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 18 Oct 2012 07:55:18 +0200
Message-ID: <20121018055518.GB24637@avionic-0098.mockup.avionic-design.de>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
 <1350375538.2332.31.camel@markz-hp6200>
 <507D856C.1070708@wwwdotorg.org>
 <507E0AC1.8020001@nvidia.com>
 <507F175A.3000406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <507F175A.3000406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2012 at 02:38:50PM -0600, Stephen Warren wrote:
> On 10/16/2012 07:32 PM, Mark Zhang wrote:
> > On 10/17/2012 12:03 AM, Stephen Warren wrote:
> >> On 10/16/2012 02:18 AM, Mark Zhang wrote:
> >>> Hi,
> >>>
> >>> I've made this drm driver worked on Tegra 3(LVDS and HDMI both).
> >>> But the code that Thierry
> >>> hosts(git://gitorious.org/thierryreding/linux.git) doesn't work
> >>> directly. If you build and run it, you'll get a white blank screen on
> >>> Tegra 3. I didn't find the root cause but I think this is not caused =
by
> >>> drm driver itself(maybe the PCIE codes?). The main symptom is: some
> >>> regulators can't be inited all the time. I tried to build drm driver =
as
> >>> kernel module, after kernel booted, modprobe the drm driver, and you'=
ll
> >>> find there are a lot of error prints like this:
> >>>
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> [   21.383529] reg-fixed-voltage 1.regulator: Failed to find supply v=
in
> >>> [   21.390299] reg-fixed-voltage 1.regulator: Failed to register
> >>> regulator: -517
> >>> [   21.397645] platform 1.regulator: Driver reg-fixed-voltage requests
> >>> probe deferral
> >>> [   21.405604] platform 2.regulator: Driver reg-fixed-voltage requests
> >>> probe deferral
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> This is normal; it's probe deferral. You'll find that those regulators
> >> initialize correctly later. Hopefully tegra-drm handles this correctly,
> >> and passes that error code through as the result of its probe.
> >>
> >=20
> > I don't think so. In normal scenario, the regulator will be inited
> > correctly finally. But in the scenario I described above, these
> > regulators will not be inited correctly all the time. Just as I
> > mentioned above, I tried to build drm driver as kernel module, that
> > means I will load drm driver after kernel booting finished. Besides,
> > during the loading of drm driver, these regulator probe error were still
> > be printed out. And I'm sure this is not the normal case.
>=20
> The Cardhu PMIC driver isn't enabled in tegra_defconfig in Thierry's
> branch. Do this:

Yeah, I think my default configuration is pretty messed up by now. I'm
in the process of merging down patches and along the way I planned to
drop all the defconfig updates and do the from scratch so that these
issues will hopefully be gone.

> > diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_=
defconfig
> > index c2a2f6e..90f4d5c 100644
> > --- a/arch/arm/configs/tegra_defconfig
> > +++ b/arch/arm/configs/tegra_defconfig
> > @@ -124,16 +124,19 @@ CONFIG_SPI_OCORES=3Dm
> >  CONFIG_GPIO_SYSFS=3Dy
> >  CONFIG_GPIO_ADNP=3Dy
> >  CONFIG_GPIO_TPS6586X=3Dy
> > +CONFIG_GPIO_TPS65910=3Dy
> >  CONFIG_POWER_SUPPLY=3Dy
> >  CONFIG_BATTERY_SBS=3Dy
> >  CONFIG_SENSORS_LM90=3Dy
> > -CONFIG_SENSORS_ADC081C=3Dm
> >  CONFIG_MFD_TPS6586X=3Dy
> > +CONFIG_MFD_TPS65910=3Dy
> >  CONFIG_REGULATOR=3Dy
> >  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> >  CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> >  CONFIG_REGULATOR_GPIO=3Dy
> > +CONFIG_REGULATOR_TPS62360=3Dy
> >  CONFIG_REGULATOR_TPS6586X=3Dy
> > +CONFIG_REGULATOR_TPS65910=3Dy
> >  CONFIG_DRM=3Dm
> >  CONFIG_DRM_TEGRA=3Dm
> >  CONFIG_DRM_TEGRA_DEBUG=3Dy
> > @@ -172,7 +175,7 @@ CONFIG_RTC_CLASS=3Dy
> >  CONFIG_RTC_INTF_SYSFS=3Dy
> >  CONFIG_RTC_INTF_PROC=3Dy
> >  CONFIG_RTC_INTF_DEV=3Dy
> > -CONFIG_RTC_DRV_PCF8523=3Dy
> > +CONFIG_RTC_DRV_TPS65910=3Dy
> >  CONFIG_RTC_DRV_TEGRA=3Dy
> >  CONFIG_DMADEVICES=3Dy
> >  CONFIG_TEGRA20_APB_DMA=3Dy
>=20
> (That still doesn't make tegradrm work for me on Cardhu, but it does
> solve the regulator issue)

I think Mark had some other modifications that were required to get HDMI
working on CardHu. Something related to the clocks IIRC. Does LVDS work?

Another thing I'm going to work into the cleaned up patches is support
for the video mode helpers by Steffen. I actually like the approach
better than the binary EDID blob, so I will probably replace the blob on
Medcom Wide in favour of a display mode entry in DT.

By the way, it would be nice if we could start to collect the various DT
snippets for the different boards. For most of the NVIDIA designs these
are still missing, just like for AC100. As for the TrimSlice I'm not
sure if it works properly.

Thierry

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQf5nGAAoJEN0jrNd/PrOhyYYQAJxodlOr6ITMQpD2OYseGsJe
2uzri7rXsru1echV1AnriRAvEZ/oUfYDns7KtFRcjLytWW4PQugX/1/Mccr2Wgyf
3ovf71P6dSqlTirDET+2AD2ikWryYGEvevIz0zzbLC4AJGx/alFX0ACAhw2O6jGO
h5D+4pySgnjbO13iKslZ9+6NUqhCCmRL5AyQjL3KAngNi7M0hE2aoaCZ7CsOd+ru
DiFaqENtxjnz8sDc+b3YzuhTtrImfhRtqjk1NDK2J7JnM194XHW97SjJK4DeXmIS
lrnsdX5Ra8iSUkT1bBquUt1D5KXiXr7+q7QMdWqRvGZY1AyhT7pnZ1iXLaxZKMFX
Ph26TzZ8WVGpOs6fpC9ZgFr416xSEcQVqzlNgWUuDz002ReQOyTVXrT8xQFS8bt2
axdf4i5iojwRQevCSAmHv7LvXeAGbneVtyfNKlQsTLvGQhsy8dJBTXS6lCZM9wW9
aFRPddNyq59Nh2/J2b8dS4HOFDDSGu2iAqJzXOFfCA8abX4sWMgivh/YL/Kg0MyN
TjFQgc10sRezaCfYZzE/9uIM79XPZ5G8+Rasez6BCeaB8UIRBHQSAOqpUOwEbiTS
UJtbO+b4yRoP6gAbdHDXCqIdFwzq8IK/T823ich69bWQXI9jry9FLNiD2MX2kueY
R2kMlQLkrCN1Bi7fwRtt
=/l1h
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
