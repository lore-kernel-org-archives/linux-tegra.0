From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: tps65910: Correct VIO voltage configuration
Date: Fri, 17 Feb 2012 08:35:44 -0800
Message-ID: <20120217163543.GC10146@opensource.wolfsonmicro.com>
References: <1329485171-14189-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329485171-14189-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2012 at 06:56:11PM +0530, Laxman Dewangan wrote:
> The VIO regulator register specify the voltage configuration
> on bit3:2 of its register. And hence only these bits should
> be modified when setting voltage and used when reading voltage
> from register setting.

Applied, thanks.

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPPoHYAAoJEBus8iNuMP3dirMP/0s4t66LUD4k+cQcNK2dZ6kq
8lMSjiMBrXrcC8B4EXlbdJuypzA6oYsoyAUVjz1fSOD7abPeKDl52kiUPcEIXLFN
deP/TSzoNlTB2IXnjgzKxyA36jV6Bg9leGuw0XDvl6klNA/yBcoUWtIsgMcGb9hM
zqq3UT7r+m99r3k8LruEB4S5x2Rz0o4Fced+3mnZNJLcGxSzqrMuBbOhLRmA/EW1
Te+L0v1PCgpdLdt5zgBJJotxS1oK11vXbbcQe5ot2gKZuHX12svhvXuRLK6gm0i8
0Qt+jBwxWswRKgk9Li+7KDyegRpYOrwJ8is5imJZCrx6I5gOgfzrodYwasmn9yF2
kyjd1r+a+zcoWFImmsK546PgjhBKF8G5p7fJEWDrbfOfCUV2urGTGO+J3M4a7GZV
TjGOcWScBt5qm0cr6O9OvcKb4uwQMKflEhStup3oSksM4CR4aK7TCsm/WqP1AFEH
esO4lMVZ4YFjqNXf+Sb/R76yr5WEebtk9dwrTVycmA5/B6O1+C/YP9zjzfodnWjK
y4hotIo/V5zVGJU4xwqEZnwT4axwFpwD3DMYVeCTECcKRzhqHhPztiRT4q0uRxcu
Aic3o08ooYIA/7tXsrbRoZi+oCyYqSB4x4dJzkS0YmLyHSOE1/15UcHlI7Sw4IQM
MNskhzzc3EKB2eXrOm1v
=Vxrh
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
