From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/1] Add Tegra124 support
Date: Tue, 27 Aug 2013 09:14:49 +0200
Message-ID: <20130827071448.GB8686@ulmo>
References: <1377229591-21235-1-git-send-email-pchiu@nvidia.com>
 <5217B267.3030205@wwwdotorg.org>
 <20130826074700.GA31726@ulmo>
 <521B89F0.2000704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521B89F0.2000704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:01:36AM -0600, Stephen Warren wrote:
> On 08/26/2013 01:47 AM, Thierry Reding wrote:
> > On Fri, Aug 23, 2013 at 01:05:11PM -0600, Stephen Warren wrote:
> >> On 08/22/2013 09:46 PM, Penny Chiu wrote:
> >>> Add the Tegra124 chip support to cbootimage. User can use "-t124" as
> >>> option to parse .cfg and generate BCT/image for Tegra124.
> >>
> >> This looks fine to me at a quick glance. Just one small comment below:
> >>
> >>> diff --git a/src/cbootimage.c b/src/cbootimage.c
> >>
> >>>  	printf("Usage: cbootimage [options] configfile imagename\n");
> >>>  	printf("    options:\n");
> >>> -	printf("    -h, --help, -?        Display this message.\n");
> >>> -	printf("    -d, --debug           Output debugging information.\n");
> >>> -	printf("    -gbct                 Generate the new bct file.\n");
> >>> -	printf("    -o<ODM_DATA>          Specify the odm_data(in hex).\n");
> >>> -	printf("    [-t20|-t30|-t114]     Select one of the possible target=
 devices,\n");
> >>> -	printf("                          -t20 if unspecified.\n");
> >>> -	printf("    configfile            File with configuration informati=
on\n");
> >>> -	printf("    imagename             Output image name\n");
> >>> +	printf("    -h, --help, -?              Display this message.\n");
> >>> +	printf("    -d, --debug                 Output debugging informatio=
n.\n");
> >>> +	printf("    -gbct                       Generate the new bct file.\=
n");
> >>> +	printf("    -o<ODM_DATA>                Specify the odm_data(in hex=
).\n");
> >>> +	printf("    [-t20|-t30|-t114|-t124]     Select one of the possible =
target devices,\n");
> >>> +	printf("                                -t20 if unspecified.\n");
> >>> +	printf("    configfile                  File with configuration inf=
ormation\n");
> >>> +	printf("    imagename                   Output image name\n");
> >>>  }
> >>
> >> To avoid continually re-formatting that text when adding new SoCs, why
> >> not start the description of the -tNN options on a separate line, and
> >> leave the indentation as-is for all the unmodified lines. i.e.:
> >>
> >>>> +	printf("    [-t20|-t30|-t114|-t124]\n");
> >>>> +	printf("                          Select one of the possible targe=
t devices,\n");
> >>>> +	printf("                          -t20 if unspecified.\n");
> >=20
> > Perhaps in the long run it would be better to turn this into something
> > like:
> >=20
> > 	printf("    -t, --target SOC      Select target device. Must be one of=
:\n");
> > 	printf("                          20, 30, 114, 124 (default: 20)\n");
>=20
> I don't like the idea of "--target 20", since "20" isn't an SoC name;
> it's "tegra20" or just perhaps "t20".

I'd really like to get some kind of consistency. We've been using the
tegra20/tegra30/tegra114 variants pretty consistently within the kernel
and U-Boot, but other tools use the abbreviated form (t20/t30/t114).
Actually I think this is the only one that uses the abbreviation, so...

> I'd be fine with a patch that allowed "-SOC" or "--target SOC", with
> SOC being "t20", "t30", ...

=2E.. perhaps introducing a --target {tegra20,tegra30,tegra114,tegra124}
option that deprecates -t20/-t30/-t114/-t124 would be a good option. I
for one sometimes get confused and can't remember the correct form to
use for cbootimage. It's mostly scripted these days, so that issue is
not that important, but using one variant only will also help to make
the various scripts consistent and easier to maintain.

Thierry

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHFHoAAoJEN0jrNd/PrOhCmsP/2kH1aag1Cqk8OIpV7wIhhDe
AMCizMb6FC4ut7+mdAlNjOoTp52ncWM++JY7RY2JKk14uFO3aF5Jm5Ecp9qV7JzF
lyHg/RVUV14mS0eAcEsP0sU/frOzwupr51Q3yt3NvHoF56/K/7W7w/2AHzU4SAE3
e/CJUY8BIYJLE6r96NcQN2Z5JdkGt+aPDz8lu9Tt45zzQyJKgHVVH3+g9D6RUAlm
W1T6a6l/bd4wQRuqvjnBr3+KAkto6xN2VdHBReQIn8SxG6cBSTSnXHmPAPm2+P+e
w3cZ7zUfU8o09kBpVGRU15EBoxY8mu4OS3+gx4AJQdyQCfvMzRS4mGhGHhLAMEOh
hfMhryu7uZpmXYnsNJvZywRKKPTysmIjrmdYwks/EXfdQqz/VghsXNO0O3nIl6hl
cwQ7tWamlWlGN2itgdXb3GzdMbr2dquYgajwt1T67kej1tXHTos3MblSbZiaPJLg
pBfbP9X9gCRpxijwpaPRTxojnLLFj7i/ehcRRDVzjurBUznVis8xsvs3N5v1lwcx
YqhW1qru1pWXj5RrcvJUlmklS/S9MQwDta/KVSSSsoXYMeQ4A+4Ds9nPxkagIrDz
JTlJx6UPUqPrBO3+hQEoqpU2YxG7TmbXna/zHpJmxoo0rclw9BCUxDWXSHZk0yWi
wkv99fx9QA8x27kWAAWL
=KAVV
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
