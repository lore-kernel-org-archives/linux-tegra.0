From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v7 4/4] i2c: tegra: proper handling of error cases
Date: Wed, 11 May 2016 16:47:52 +0200
Message-ID: <20160511144752.GD1716@katana>
References: <1461591519-24602-1-git-send-email-smohammed@nvidia.com>
 <1461591519-24602-4-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461591519-24602-4-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 07:08:39PM +0530, Shardar Shariff Md wrote:
> To summarize the issue observed in error cases:
>=20
> SW Flow: For i2c message transfer, packet header and data payload is
> posted and then required error/packet completion interrupts are enabled
> later.
>=20
> HW flow: HW process the packet just after packet header is posted, if
> ARB lost/NACK error occurs (SW will not handle immediately when error
> happens as error interrupts are not enabled at this point). HW assumes
> error is acknowledged and clears current data in FIFO, But SW here posts
> the remaining data payload which still stays in FIFO as stale data
> (data without packet header).
>=20
> Now once the interrupts are enabled, SW handles ARB lost/NACK error by
> clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended
> the error and will parse/process stale data (data without packet header)
> present in FIFO which causes invalid NACK errors.
>=20
> Fix: Enable the error interrupts before posting the packet into FIFO
> which make sure HW to not clear the fifo. Also disable the packet mode
> before acknowledging errors (ARB lost/NACK error) to not process any
> stale data. As error interrupts are enabled before posting the packet
> header use spinlock to avoid preempting.
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
>=20
> ---
> Changes in v2:
> - Align the commit message to 72 characters per line.
> - Removing unnecessary paranthesis.
> - Handle error in isr
>=20
> Changes in v3:
> - Printing error if tegra_i2c_disable_packet_mode() fails
>   is already present and handling error is not taken cared
>   in ISR which was done in v2 but keeping return error in
>   *wait_for_config_load() as its used in tegra_i2c_init()
> ---
>  drivers/i2c/busses/i2c-tegra.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 8d49995..1181bbf 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -194,6 +194,7 @@ struct tegra_i2c_dev {
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_suspended;
>  	bool is_multimaster_mode;
> +	spinlock_t xfer_lock;

This lock needs a description. The sentence from above is a good
template: "As error interrupts are enabled before posting the packet
header use spinlock to avoid preempting.".

Patches 3+4 look good otherwise but need to be rebased on modified
patch 2.

Thanks,

   Wolfram


--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXM0YYAAoJEBQN5MwUoCm23J0QAJ8uSAsw+eAxfvP1vaIA5lRd
avIPCnJLLEap+njhJpsFjVqW+xROGTQcGlFFAR8P5VxGtAHqqm3EtqMTUbWQZbeU
xjt0UupvbHCrfvJvUdcAgnV9dTTyGQPccopzsgrXWEOkztr8ZqvlvSnQIinjfo72
Td01GsHfYQpZpaFf5MQSubE/i7yav9Oa+m1+f+Q2lg8LJuoR3suasRCHTObRz5G2
5GY2qqw2muD6YCvKV6yNXMvwaJvdfchlJKS8JKP6Afk78GLb7OPq62fsG99i+JO0
udIe9E/NDvVp67HVgLorYPV2kAmrMY8sGadURl1pgmVVCcbrFeYqeA7ZwBXz+KdX
2AZ083eVYBi2pfIg6v8fC8afGc9Em42/cKGMWoX26xFkuD8Lwx+0CHWfQtHDK5s4
lC8K4ZpOY7BAa7i4jjE2UhGs37QKd/2ZmknKnQPTwyRLuo6gaqPDhqS4VSjQ+Hq5
+88kTNfdg5/7MymS1jqgYopv1n/zCtsy9a3TDKHNfNeq2ogSuqB9inHEU31/ZbC7
q/jaT51Fq/co7x+b8OqsUtHFath06m1e96HRhgZAjX/8zF5QTE9s0WAmr78df6kc
BjOd6TJrkF3G2IQvM7UdYLgjtqAn8MrqBdfvhRf0nkMMoj+nIY52gJP/pqP220cs
kYkQQIoGjsTQNkhKiDix
=oBJz
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
