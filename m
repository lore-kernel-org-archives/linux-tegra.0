From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1 2/2] mailbox: tegra: avoid resume NULL mailboxes
Date: Fri, 14 Jun 2019 17:52:10 +0200
Message-ID: <20190614155210.GC26922@ulmo>
References: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
 <1560515734-2085-2-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560515734-2085-2-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:35:34AM -0700, Bitan Biswas wrote:
> If Tegra hsp device tree does not have 'shared irqs',

s/hsp/HSP/, otherwise looks good.

Thierry

> mailboxes pointer is NULL. Add non-NULL HSP mailboxes
> check in resume callback before tegra_hsp_mailbox_startup()
> call and prevent NULL pointer exception.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/mailbox/tegra-hsp.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index f147374..a11fb1c 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -782,11 +782,13 @@ static int __maybe_unused tegra_hsp_noirq_resume(st=
ruct device *dev)
>  			tegra_hsp_doorbell_startup(db->channel.chan);
>  	}
> =20
> -	for (i =3D 0; i < hsp->num_sm; i++) {
> -		struct tegra_hsp_mailbox *mb =3D &hsp->mailboxes[i];
> +	if (hsp->mailboxes) {
> +		for (i =3D 0; i < hsp->num_sm; i++) {
> +			struct tegra_hsp_mailbox *mb =3D &hsp->mailboxes[i];
> =20
> -		if (mb->channel.chan->cl)
> -			tegra_hsp_mailbox_startup(mb->channel.chan);
> +			if (mb->channel.chan->cl)
> +				tegra_hsp_mailbox_startup(mb->channel.chan);
> +		}
>  	}
> =20
>  	return 0;
> --=20
> 2.7.4
>=20

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0DwqoACgkQ3SOs138+
s6HJehAAlPsKTuPsEIq3BYzsUwtxA2ZtjCFy0N/+cOom6PoIlmFZQ3ZqVVYmVGUt
6sP7L8VoUzcgP1LXassF3wiTLv7/Il+hWM9SxHN5k8a1UBEnij4vxtt13/vIirLh
FfeV5AyZZ7FmgsyGm/ZM41evcYZg/WM6JKXaHGMjbxMhxXk2sQxH98WY2urTSxoz
rb2+MRrTQu5jrbUiF//cjSrULA6tcldY567nFyFPTRTu8e+jtqGna1lMDIrNHw5q
n3SR3Z5sOobv5R5qcp4SBBrHLRMPaiIPiGrLnUccLDsxrjYzeII51Ij2ib5y4osZ
BfALmCAAy06DoJWoeTLH706nEv0hIeXTYTQSgWgY2Jqzt68beW0pOc59KFjcn/fr
4yK51+AqGwwYNfnlVSp1WdJD4eXdahHzBWFpBzr9koHpsYUeTnUfMNfrZRHsOPJb
9gWbFUmUj7O7QzTdB5coMcmhSi9bpGd9B5/9Lrk7S/fKRUQfI6YhjHRhaZTG3R80
7Yg5p133EU334sl3K6i91ekysja57vJDlQngieJzGWRZRItjMOSI+l2PxsGXD4Z+
KTXVl57gbB6Zl5W44CWfAo0N/+UblHIfLn81x6hmAuD5G3ewHVj0CcG0ccyn2Cem
H1NjV3NH0goy6jG2v/XfL88I38u2Hm9ZG03yK80lJekkZ+nS5OY=
=ErAC
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
