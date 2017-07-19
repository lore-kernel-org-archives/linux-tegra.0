From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] irqchip: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 12:49:41 -0700
Message-ID: <87tw28dx62.fsf@eliezer.anholt.net>
References: <20170718214339.7774-30-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718214339.7774-30-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek@xilinx.>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>

For bcm283x:

Acked-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllvt9UACgkQtdYpNtH8
nuhwQA/+PlDicnq8EVVpUAsGPV3jsdXBJLxEUlDxOCIFEJ5WUUL7oKMt67ShrKPg
ACAAvMZFx+HBZeeuIvoQANUPvAUk16XJ66Du+VhMfeRMVLUBkZC0MPa6tSHtq/8x
KdGW2OON4sqFiN2bJ+TCJoAq5e8LLjObOEZpdu42LixoC64OaX1COx2GxXgEcLf3
lfl5CS5YFZQGLlZOxDxl7+JlUyPxDPEnTwnKy5/awL913QvulJs7PnQreASk1BU8
mkVqQO6cJhzkFhv5uOmwtflPIanUHhhboLpueeZGpOGBLCSlgj10AmfVW+jwN5As
yMTeMNhXSIuTK1aqwo4vPswgXNoE7V7c6bGNNdoCvj9EGAAQM8tgs1EI01fAKr4N
QnUlF2WjE9WiP7Z381SFUtSPqymRB089hiCGQkuJQxuAcTINPNZAdthVOkNiiqU/
RbneQdb7psI8dJAJLXASGqAHx54+vLjhleIM4Ny5FsmzSQmuVaECpxgi/1VUPK3B
il4qqM2fFkpG8NMTHiQ9xLjfq/CcT9ehC3/6PMCRJz9Tc/mDyIDmUz6YOaEpADni
Qtph9/lTh7wB35Nd1A53ffjluvO2Sz2Vs+ko1oRY2pnbDUyZsaxzPBlBOQgbpD5x
PgqOYZO052GOiet75x5jBbM/tV4LrS2iSzLFV7LtHhVGQppOT48=
=H3jB
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
