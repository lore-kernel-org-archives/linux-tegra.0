From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Mon, 22 Sep 2014 12:07:47 +0200
Message-ID: <20140922100746.GM1470@ulmo>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0999733503=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0999733503==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hnsKUeImFCk/igEn"
Content-Disposition: inline


--hnsKUeImFCk/igEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 19, 2014 at 03:53:48PM -0400, Sean Paul wrote:
> Per NVidia, this clock rate should be around 70MHz in
> order to properly sample reads on data lane 0.

Can you point out where you get 70 MHz from? I only see the TRM mention
72 MHz that are needed for calibration.

Also, what's the effect of doing this? Does it fix an issue that you're
seeing?

Thierry

--hnsKUeImFCk/igEn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH/TyAAoJEN0jrNd/PrOh2KcP/j9ZYkY6QpsUNmpOS+XEy3Cx
UiKwYou96LqzURPuqvyx0ONcJtyG88ChQGJCmHhTKbOitFNBqeHqIrSTwIpSvIAy
OjRAmBVQOoSMfFXEHg3V/Gq63nP3PYaEZQ9rB+s9pPpKQ2nknqEPdfd2lJmpyqi7
Y+y+UvUK0FSaPsUrFdDPXuJMtLgd2BfxxQLKovcxK3CRk7puAp+m0UpnO0rn20D3
Tb7wbrmI68Lx5zXPSWWhu98DHlbSUz8SLP7opfGtF80wnqCq9IiRo62Emws+EKX0
mL5mCZvGxnPv4wE/xHwc3yElrWQDI/9zsoTgwgzu68PPXpdQ/LfX5Flfdxt3WjCG
EILyNJc3O8mKTLsZbTfyioW/GI+00YBUObg5pBdaeo5BYtn6mKB5LBKpVdrvkMoX
R0Ho3Or614/y2rfcD1ut7gOXzeRJujOEREycQOoNDICTgsJrk8wRl8ginoB7XIDQ
UZVDXBE+4f2US8njGEQkBaRpaOcDwt3XAQSRLQwUwhbZnnsMaw+ktzxt98N7rrvP
VJ8hc72HRvqO36fCSpC5MycVfMD5MJO3mmYZSXb5S7oWRWioyAuntCBbKWKD+R5L
bUakTn+9zDB93580SZXyl0gDJ2aybs8EUBPtlY84xhBsdTJ1EFMGigEyrGWVsKgP
kzllZ6KY5AALP7Sdb0p2
=6qjI
-----END PGP SIGNATURE-----

--hnsKUeImFCk/igEn--

--===============0999733503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0999733503==--
