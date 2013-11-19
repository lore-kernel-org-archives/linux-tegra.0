From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 17/31] ASoC: tegra: call pm_runtime APIs around register
 accesses
Date: Tue, 19 Nov 2013 09:53:34 +0000
Message-ID: <20131119095334.GW2674@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-18-git-send-email-swarren@wwwdotorg.org>
 <20131116100205.GG15393@sirena.org.uk>
 <528A4D9A.10809@wwwdotorg.org>
 <20131118183947.GS2674@sirena.org.uk>
 <528A96EC.4040409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sL7C0a98p/u5aVah"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528A96EC.4040409-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sL7C0a98p/u5aVah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 03:38:36PM -0700, Stephen Warren wrote:

> 1) regcache_sync() doesn't mean "if the cache is dirty, flush the
> dirty registers to HW", but rather, "if the cache is dirty, write any
> registers that don't match HW defaults to HW". If the HW was in
> cache-only mode because simply because clocks were turned off but not
> power, then the register values were retained, and the current HW
> register values may not be "HW defaults", and you may in fact /need/
> to write a value to HW that matches the HW default, yet is different
> from the current retained register content.

OK, that's a potential problem in general...  Fortunately most of the
uses actually cut power.

> a) Make regmap creation read the initial HW state to use as HW
> defaults when the regmap is created. IIRC, this is done for some
> regmap configurations but not others. That said, this doesn't seem
> correct, since there's no guarantee that the HW state when the regmap
> is created /is/ the default HW state.

Right, this is why we don't initialise the cache by default.

> I think I still prefer option (c).

there's also the option of doing an explicit read on that register to
get it into the cache.  But yeah, like I say I'm not totally against
this and I did ack it already.

--sL7C0a98p/u5aVah
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSizUbAAoJELSic+t+oim9x90P/18BOVXrSMDdMXlxhpoP7ngI
4bekf/HAYt8TsGSUR4P1yYCsr6i5OqkKOyhzSh9yUcNGxPjUd+DoBN4Q9nKPVKdp
eOzPElbL3qjQ2VKrpAGxU/CzC9T7ff4WA8k0k1CzKxsyy0IC1J+KwXVR2t1lXH23
sq58alCeA9vXJg2fGyfnAvni1I7C3kKfb8oKo8Iy4ZaYrM6lRouUfVefYXM5Mkmt
bDDxHyKZd5mW5Ub0o85yz+CnNUYZBdG9sPlU1slKWD7eCTj4MQjbzsWDsW4+E4tf
oa1CbNdiR8Z2cl8ZNtegsJlv3aF7DeN5+6nErnEfjptw3Z2TTxM0mCINdUAG/QIJ
v2EoBNn3M3TttGmQvafmpSEmbxHSw+EWxyB356uoLmrqqbBIrxc7TwUpG0DNAamX
NJB/1JCJS9E1q2XgsRvkR6dHSl8BAWb5HZqj0vC95vnigXKxWNDk9xFQLp/DwEG5
gJIs8kidKomqZOfxuBLy3QFMbJ5GOhH4eI1MwtqaFCyH9VHErRn+yttoZE2+2wxl
qSnAggIMpip4texksfjx6AIYwx+S4MG3x1rj7dyGuP7QK1mwj+mvCY2FP2LL7oEG
RojfzVUEwRrOGkw7nKLoN7Ozw6CDaQb12uZlFHsmJYYh/G7xLUH4fxP28brz7UIn
AmtEWBgAODjTinYhsJ5X
=2Xor
-----END PGP SIGNATURE-----

--sL7C0a98p/u5aVah--
