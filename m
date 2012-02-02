From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 3/4] ASoC: Tegra+ALC5632: Enable headset
 autodetection on PAZ00 board.
Date: Thu, 2 Feb 2012 22:44:02 +0000
Message-ID: <20120202224355.GD3112@opensource.wolfsonmicro.com>
References: <1328213618-15870-1-git-send-email-leon@leon.nu>
	<1328213618-15870-4-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4750929100721639268=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1328213618-15870-4-git-send-email-leon@leon.nu>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Leon Romanovsky <leon@leon.nu>
Cc: olof@lixom.net, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, swarren@nvidia.com, lrg@ti.com
List-Id: linux-tegra@vger.kernel.org


--===============4750929100721639268==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2012 at 10:13:37PM +0200, Leon Romanovsky wrote:
> This patch is adding device tree support of headset autodetection on PAZ00 board.

Applied, thanks.  I wonder if we ought to have a standard binding for
GPIO based headset detect...  can be tricky, though, when it gets
integrated with more advanced mechanisms.

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPKxGkAAoJEBus8iNuMP3dU/4P/jboAM0QqO/kvYtT8CtabdMF
2Tcw4tF3EFMBv7BpxBRsmrAqgvEVmB7ea1IHcv9inB27GhIzQTyv2uFUMk7xUhgl
4OWcliNRPTK4KqoFRNwWZvpAKjLmPrhvKHjDm8o7FxPsiHs8lhJZfaXlP69DuUjc
lVSn6TtfNDNcp81Z9SABiIP7jIb/CTdcZrzDA7gTc639Z0UatbXs2x0S39nmzrS5
FjVEYIyJie4UXJgciGATDmyd2iMDEGNk8Ld0e8HflxXbp31oGx1ct9545gNiRVEn
byHGEPpYyr6D3Kqr0WCc2U/n5ukJ/1Jne+4UwYtSUXL243oeW4f8/oYgPzqm7CWT
lTRkYtpekJVvqpf4CJE5UTHXOe25uxWLhYcoabjlfZ6e0ci5D1NdPOXQmVNX5ZVP
1jTf2vF5LAFP3hXcftmHFCrWho9khPuc/ebhHcNcZx529Yokf67ck+1nA59jelM4
hc68bAV67V0J23PpjE8H85dpf80lA5UOPkS/gGHXqvENbXgRFUqAovqxn1e2GH7a
0teXTVyS8kwB+MAVUOUM4uOMpxG0KR0hUuyRkbLXmlnoWWhNkNk7JKi/UyE/vGNR
b7QdhdQzA65DLUWOBeX8ouYvAySJyOLNkH5wfArMzjB3gZPC5KhFdbXISUL8+wTH
Hv3qpS9RrTXy795MW/vb
=oUsS
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--

--===============4750929100721639268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4750929100721639268==--
