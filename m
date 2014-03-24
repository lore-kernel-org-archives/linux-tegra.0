From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/12] drm/nouveau/ibus: add GK20A support
Date: Mon, 24 Mar 2014 23:34:45 +0100
Message-ID: <20140324223444.GF17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-7-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2048779847=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-7-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============2048779847==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline


--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2014 at 05:42:28PM +0900, Alexandre Courbot wrote:
[...]
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c b/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c
[...]
> +#include <subdev/ibus.h>
> +
> +struct nvea_ibus_priv {
> +	struct nouveau_ibus base;
> +};
> +
> +static void
> +nvea_ibus_init_priv_ring(struct nvea_ibus_priv *priv)
> +{
> +	nv_mask(priv, 0x137250, 0x3f, 0);
> +
> +	nv_mask(priv, 0x000200, 0x20, 0);
> +	udelay(20);

usleep_range()?

> +static void
> +nvea_ibus_intr(struct nouveau_subdev *subdev)
> +{
[...]
> +	/* Acknowledge interrupt */
> +	nv_mask(priv, 0x12004c, 0x2, 0x2);
> +
> +	while (--retry >= 0) {
> +		command = nv_rd32(priv, 0x12004c) & 0x3f;
> +		if (command == 0)
> +			break;
> +	}
> +
> +	if (retry < 0)
> +		nv_warn(priv, "timeout waiting for ringmaster ack\n");
> +}

Perhaps I'm being paranoid, but this loop now depends on the frequency
of the various clocks involved and therefore might break at some point
if the frequencies get sufficiently high.

So a slightly safer implementation would use a proper timeout using a
combination of msecs_to_jiffies(), time_before() and usleep_range(),
like so:

	timeout = jiffies + msecs_to_jiffies(...);

	while (time_before(jiffies, timeout)) {
		command = nv_rd32(...) & 0x3f;
		if (command == 0)
			break;

		usleep_range(...);
	}

	if (time_after(jiffies, timeout))
		nv_warn(...);

This assumes that there's some known timeout after which the ringmaster
is expected to have acked the interrupt. On that note, I wonder if the
warning is accurate here: it's my understanding that writing 0x2 to the
register does acknowledge the interrupt, so the ringmaster does in fact
"clear" it rather than "acknowledge" it, doesn't it?

Although now that I mention it I seem to remember that this write is
actually sending a command to the ring master and perhaps waiting for
the register to return to 0 is indeed waiting for an ACK of sorts. Maybe
adding a comment or so describing what this sequence does would be
appropriate here?

Thierry

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMLMEAAoJEN0jrNd/PrOhTnYQALxMAyx6C5uktVz+P1nQTFPv
zzyZBe3LycCcoQsy2Yy+3ND+8OgA56zCsGYCEdhbjRScADzUjq4QpX0eMxCVFEkH
2DuyFyJgRuwZwgJLXQEY+xlJQlSCA07E4caM7BRPchYBSuOmeDgSritSZQVq2D+z
r8mIegwsto90nfjN20M8BPBReatvVNYh25hZEvdysX90MlEonq1P+cEUPa+QSe7D
foH1sQqt7kfpPOMsOcYhq+ZAXGyxDNuuokxV1Ie+bsSYvcJr1HQ6gdPFPCjvHAbr
ek9M2EVDdK072oX+sFKe8lCpKJQSUfm8WHMjRR5qpyfKHiFl5aGSULe6Ihs8MA1n
mGYVzcUF/4XruASL02TbqQ81rqMRWv6vrjfri7oWUBhl4go7L1bB1PKKZEpvowNP
RHrCD2QnjXvvLaFHTwxsLGouwqiCSS4eILK9vijLkKTKguiwFv5ypBM01ch+U1cq
QwEMh0+YySSl5R3muiPalK2De1SBuA/UTkKxj7EydyigTpeOtzgW4oxqTI2Z56vj
hrHh9++5PDZ4DKLtAPhaUoFT922BACbG81lNqIouN8IpnOv+s786ETwdd2/9nVbr
/YxsiSXzS+ipdeLcFRkil+mf+slu8Gn+vsS8KwZNow5sWlpRT9s8x5hcOn6Id7rE
jRzpsKlbBh6NdJCfQupv
=6rRj
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--

--===============2048779847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2048779847==--
