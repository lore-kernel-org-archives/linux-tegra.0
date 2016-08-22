From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/12] firmware: tegra: Add BPMP support
Date: Mon, 22 Aug 2016 17:00:58 +0200
Message-ID: <20160822150058.GA21012@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-6-thierry.reding@gmail.com>
 <94227d94-1d60-fda7-731b-26656633d585@nvidia.com>
 <20160822125458.GC17367@ulmo.ba.sec>
 <6bb4d32f-4f13-285e-430e-672f375a9a46@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6bb4d32f-4f13-285e-430e-672f375a9a46-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 03:24:28PM +0100, Jon Hunter wrote:
>=20
> On 22/08/16 13:54, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, Aug 22, 2016 at 10:26:50AM +0100, Jon Hunter wrote:
> >>
> >> On 19/08/16 18:32, Thierry Reding wrote:
> >>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> The Boot and Power Management Processor (BPMP) is a co-processor found
> >>> on Tegra SoCs. It is designed to handle the early stages of the boot
> >>> process and offload power management tasks (such as clocks, resets,
> >>> powergates, ...) as well as system control services.
> >>>
> >>> Compared to the ARM SCPI, the services provided by BPMP are message-
> >>> based rather than method-based. The BPMP firmware driver provides the
> >>> services to transmit data to and receive data from the BPMP. Users can
> >>> also register an MRQ, for which a service routine will be run when a
> >>> corresponding event is received from the firmware.
> >>
> >> MRQ?
> >=20
> > I think that means "Message ReQuest", which is sort of like an IRQ but
> > the user will receive a message (with potentially payload) instead. Do
> > you want me to spell that out in the commit message, or what would you
> > suggest?
>=20
> I think that if we simply say 'Message ReQuest (MRQ)" it becomes clearer
> what this is. Otherwise, google returns everything from 'most recent
> quarter' to canadian rock bands :-)

Okay, done.

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuxOoAAoJEN0jrNd/PrOhaXsP+gJV0HIl5S4rKrbm20XXYtt7
SwLPOY1Z1iPESRvm70wMw5c+U4QwCAycFP7lvZQJu1Cb25N38ytElYE/rNkXeYf6
wLrLGxInd26x3X+TDLE+3f4mcT9R5mVGrDJXS4l0ZxhWiSOXrXm7zGlMFzLbDfMr
t5GD90/ryn2dwHkJtuPNdecl3kQqB4qGnEhIIT5wZIs0HpqJ2AE4Ass9npXgygZu
sjpzLCe9okTBsyaAb4PUeCMdeV7lZraBQj9eD0Fw+g2h5CUaeh+mbNHlrdJ1mett
hYQ/iMzmK7vjX4EhqPPdWo15BFOwUA4JxU2VB8U2UpcDJKdF026tUrGHDefkAkrd
X5BA26rLwDbVOxAOomdcUarl2BSzZUPHfFZWwqGFyqyx7R6tWgzbXCDnzYM20XIB
/hsq0q1Zaj4V5xEJlqMWB4en5rZsImxOkRQM4OugEO60rQ0GSEwkTgb20wpkyNQH
TxfUTkDjqwTAEO6wEvuAKQFiI+I4HO2/AvnA+reeORobMD4ADonQmNRThVA2ebmw
DDpmz9LfX1LKCS1WcHYyw1owP8doMKtsH1x4Oe+h9kCOzelyvv52okA0kSuf51+g
/2bN6jq3F1LY+wmdseQptLh7ULgMD4L1rNaDHzCZGXCx2m4iTMHF9EqpghJoX9aS
+UdBBuEkCqsrJai1QuD9
=sOmz
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
