From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] ALSA: hda - Avoid potential deadlock
Date: Thu, 24 Sep 2015 12:50:10 +0200
Message-ID: <20150924105010.GA6906@ulmo.nvidia.com>
References: <1442484006-9614-1-git-send-email-thierry.reding@gmail.com>
 <s5hfv258q33.wl-tiwai@suse.de>
 <s5hio705epm.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hio705epm.wl-tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 11:49:57AM +0200, Takashi Iwai wrote:
> On Wed, 23 Sep 2015 11:03:44 +0200,
> Takashi Iwai wrote:
> >=20
> > On Thu, 17 Sep 2015 12:00:03 +0200,
> > Thierry Reding wrote:
> > >=20
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > The Tegra HDA controller driver committed in v3.16 causes deadlocks w=
hen
> > > loaded as a module. The reason is that the driver core will lock the =
HDA
> > > controller device upon calling its probe callback and the probe callb=
ack
> > > then goes on to create child devices for detected codecs and loads th=
eir
> > > modules via a request_module() call. This is problematic because the =
new
> > > driver will immediately be bound to the device, which will in turn ca=
use
> > > the parent of the codec device (the HDA controller device) to be lock=
ed
> > > again, causing a deadlock.
> > >=20
> > > This problem seems to have been present since the modularization of t=
he
> > > HD-audio driver in commit 1289e9e8b42f ("ALSA: hda - Modularize HD-au=
dio
> > > driver"). On Intel platforms this has been worked around by splitting=
 up
> > > the probe sequence into a synchronous and an asynchronous part where =
the
> > > request_module() calls are asynchronous and hence avoid the deadlock.
> > >=20
> > > An alternative proposal is provided in this series of patches. Rather
> > > than relying on explicit request_module() calls to load kernel modules
> > > for HDA codec drivers, this implements a uevent callback for the HDA =
bus
> > > to advertises the MODALIAS information to the userspace helper.
> > >=20
> > > Effectively this results in the same modules being loaded, but it uses
> > > the more canonical infrastructure to perform this. Deferring the modu=
le
> > > loading to userspace removes the need for the explicit request_module=
()
> > > calls and works around the recursive locking issue because both drive=
rs
> > > will be bound from separate contexts.
> >=20
> > While this looks definitely like the right direction to go, I'm afraid
> > that this will give a few major regressions.  First off, there is no
> > way to bind with the generic codec driver.  There are two generic
> > drivers, one for HDMI/DP and one for normal audio.  Binding to them is
> > judged by parsing the codec widgets whether they are digital-only.
> > So, either user-space or kernel needs to parse the codec widgets
> > beforehand.  If we rip off all binding magic as in your patch, this
> > has to be done by udev.  With the sysfs stuff, now it should be
> > possible, but this would break the existing system.
> >=20
> > Another possible regression is the matching with the vendor-only
> > alias.  Maybe the current wildcard works, but we need to double
> > check.
> >=20
> > So, unless these are addressed, I think we need another quick band-aid
> > over snd-hda-tegra just doing the async probe like snd-hda-intel.
>=20
> Does the patch below work?  I only did a quick compile test.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> -- 8< --
> From: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
> Subject: [PATCH] ALSA: hda/tegra - async probe for avoiding module loading
>  deadlock
>=20
> The Tegra HD-audio controller driver causes deadlocks when loaded as a
> module since the driver invokes request_module() at binding with the
> codec driver.  This patch works around it by deferring the probe in a
> work like Intel HD-audio controller driver does.  Although hovering
> the codec probe stuff into udev would be a better solution, it may
> cause other regressions, so let's try this band-aid fix until the more
> proper solution gets landed.
>=20
> Reported-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
> ---
>  sound/pci/hda/hda_tegra.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)

Yes, that fixes the hang that I was seeing:

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

As a matter of fact this resembles a patch that Jon had worked on to
solve this. I'm slightly concerned that merging a band-aid like this
is going to remove any incentive to fix this properly, though.

Thierry

> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 477742cb70a2..58c0aad37284 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -73,6 +73,7 @@ struct hda_tegra {
>  	struct clk *hda2codec_2x_clk;
>  	struct clk *hda2hdmi_clk;
>  	void __iomem *regs;
> +	struct work_struct probe_work;
>  };
> =20
>  #ifdef CONFIG_PM
> @@ -294,7 +295,9 @@ static int hda_tegra_dev_disconnect(struct snd_device=
 *device)
>  static int hda_tegra_dev_free(struct snd_device *device)
>  {
>  	struct azx *chip =3D device->device_data;
> +	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> =20
> +	cancel_work_sync(&hda->probe_work);
>  	if (azx_bus(chip)->chip_init) {
>  		azx_stop_all_streams(chip);
>  		azx_stop_chip(chip);
> @@ -426,6 +429,9 @@ static int hda_tegra_first_init(struct azx *chip, str=
uct platform_device *pdev)
>  /*
>   * constructor
>   */
> +
> +static void hda_tegra_probe_work(struct work_struct *work);
> +
>  static int hda_tegra_create(struct snd_card *card,
>  			    unsigned int driver_caps,
>  			    struct hda_tegra *hda)
> @@ -452,6 +458,8 @@ static int hda_tegra_create(struct snd_card *card,
>  	chip->single_cmd =3D false;
>  	chip->snoop =3D true;
> =20
> +	INIT_WORK(&hda->probe_work, hda_tegra_probe_work);
> +
>  	err =3D azx_bus_init(chip, NULL, &hda_tegra_io_ops);
>  	if (err < 0)
>  		return err;
> @@ -499,6 +507,21 @@ static int hda_tegra_probe(struct platform_device *p=
dev)
>  	card->private_data =3D chip;
> =20
>  	dev_set_drvdata(&pdev->dev, card);
> +	schedule_work(&hda->probe_work);
> +
> +	return 0;
> +
> +out_free:
> +	snd_card_free(card);
> +	return err;
> +}
> +
> +static void hda_tegra_probe_work(struct work_struct *work)
> +{
> +	struct hda_tegra *hda =3D container_of(work, struct hda_tegra, probe_wo=
rk);
> +	struct azx *chip =3D &hda->chip;
> +	struct platform_device *pdev =3D to_platform_device(hda->dev);
> +	int err;
> =20
>  	err =3D hda_tegra_first_init(chip, pdev);
>  	if (err < 0)
> @@ -520,11 +543,8 @@ static int hda_tegra_probe(struct platform_device *p=
dev)
>  	chip->running =3D 1;
>  	snd_hda_set_power_save(&chip->bus, power_save * 1000);
> =20
> -	return 0;
> -
> -out_free:
> -	snd_card_free(card);
> -	return err;
> + out_free:
> +	return; /* no error return from async probe */
>  }
> =20
>  static int hda_tegra_remove(struct platform_device *pdev)
> --=20
> 2.5.1
>=20

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWA9VfAAoJEN0jrNd/PrOhJBwQALxFNV09P5zCUF7mRk5t3nTp
AX8Lm9C16cqVk4wrKTsdDlGgKlt2aKGtbhUHbDTFXw3Qi9Uw/Zq65L5/gyHIE1+n
xx1ud0rWWHB1j+xJoIga6dVgf+zNFPu0adAm9NmYoX3Sr1MDSAbDrbQnD+IbMslf
eQh+b8DmDYqCn4Bc4eVLiELT2wS5n7by8+gZTxZJ5gAE/GGXFHkjn8FAolLW0mXx
n6czogUQmlLrNVIH6OPqTLUeu5YUFGoz7tsBoTE3N6JmPhSc+Yh5EUeFyNKBMLzg
HsLbiTQkzeGGICdqekwtytwlj13pM1+RYWog4qW0iIDX9zQ8jINmOZi+EhE7v2ks
MPuaitZUSAefWREwAquzXRAQvk8bwnaDCyGPZENAzrhS241ei2A62TPPqDtiXV+D
Exp0NUm39ATbtcXvFEbifz0msVYmeBlGUgU1zoeg6HFlEvkWcQaXbRv1di77FcXS
LKM3fyEQlF/Yvle1GEk3wW15sk50aECKB2pENxvMuT0Sz24vMKhkyFyo+dmeIkH2
X6pMRWchwMeRyk3n6f6YA1NwjKmo6FYEU5W8A9lYlYJw7qcN9PwfjCagbAm3t1UG
Ukz+ndx7hcLykslc4AYgymb2D40xjPQBjGRiISGkL54OezrtoSada+2tXmg2WleE
YWoyQ5LmSSXk+BX7lhaq
=i5PC
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
