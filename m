From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 16:37:00 +0200
Message-ID: <20160422143700.GA7068@ulmo.ba.sec>
References: <1461334479-27985-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461334479-27985-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com, swarren@wwwdotorg.org, gnurou@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 07:44:39PM +0530, Shardar Shariff Md wrote:
> Initialize default channel slave_id(req_sel) to invalid id
> (i.e max supported slave id + 1) to avoid overwriting of slave_id
> during tegra_dma_slave_config() with client data if slave_id
> is not initialized through DT
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
>=20
> ---
> Changes from v1:
> - Instead of initializing the slave id to -1 define macros for
>   max slave id and invalid slave id and do the checks accordingly.
>=20
> Changes from v2:
> - Check slave id boundary before dma channel is allocated to
>   avoid channel leakage.
> ---
>  drivers/dma/tegra20-apb-dma.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Looks good to me, though I'm not a DMA engine export, so I'll only
offer:

Acked-by: Thierry Reding <treding@nvidia.com>

Perhaps Jon would be comfortable enough to give a Reviewed-by?

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGjcMAAoJEN0jrNd/PrOhSW0P/2mg/QFl0oTs98Xg1ryWqSut
fkeZf5EVk1gxZORT2jQ+Z0mjLujPFarSjtQboGbGE3v/xUhQCosi7QODqSKJ4NIk
KHLs81EjtqezTVcW6sJhMJw3QkUVAdoyxvjcvThwB3NDLU3FnUARNU9AW4f5c74k
2b4sSFpbrKfbnOWwwI9YmZggivs52ujJq4igZ3VpQpMimr5TrsJd5CunNqjrwHuM
XVLNAUyL1nQg3XGITCm0pihYC/mUKlf3xAZly3w2WkULMmdvVYaHx74C+XWopxAj
vQItawC7+8XwlHy9X6fT2WNTAdP60x84nPWZ2Fjt/FnVHnZORvoBw/jISdsEpLfc
9//Adhkoj/5hLyDl/+/delyFwntmLh7nBIHOlIrwrPR4RK6/idpWxHBUk0EDKbBG
QulDqqrjI/juX49WEaL7xOxQzlu5M+g501OBb4CiYzUOjxkwqdlzGWPFreDw9dH+
/uF+hyktpNDLOSC5+gNtApX8JK+pTFJlyxZswqlU6pvLsnIqpjkiBF5OixuqmsJ0
Ah6KTz8Rmgt/5/F5srf9f2eT3WWpYxpAs91+zso3Yfjn8Ddjf30IOEFdqnH44cGs
atyhCD8/RrVoGp8+iRQwIvbxjI2qHsw1YYfLLGnM9vo3Ypl5HBngmhgZA1sd4a87
DmTvaTMHoZRAuSUN7ILI
=EkYE
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
