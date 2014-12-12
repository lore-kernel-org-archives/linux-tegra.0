From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Kernel BUG from tegra_dc_irq()
Date: Fri, 12 Dec 2014 11:01:29 +0100
Message-ID: <20141212100127.GA18681@ulmo.nvidia.com>
References: <548AA7B3.7080400@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548AA7B3.7080400-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--cvVnyQ+4j833TQvp
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2014 at 05:30:43PM +0900, Alexandre Courbot wrote:
> Hi Thierry,
>=20
> I sometimes notice the following oops happening. Generally when I am runn=
ing
> Weston/glmark2 for long periods of time (at least 4/5 hours). I am trying=
 to
> see if I can reproduce it with simpler workloads. Are you aware of this?
>=20
> Cheers,
> Alex.
>=20
> [18468.532205] kernel BUG at ../drivers/gpu/drm/drm_irq.c:1032!
> [18468.537857] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> [18468.543679] Modules linked in: nouveau_platform(O) nouveau(O) cfbfillr=
ect
> cfbimgblt cfbcopyarea ttm
> [18468.552789] CPU: 0 PID: 210 Comm: weston Tainted: G           O
> 3.18.0-00029-g0924e632ef58 #2780
> [18468.561735] task: ed6492c0 ti: ec560000 task.ti: ec560000
> [18468.567131] PC is at drm_vblank_put+0xbc/0xd0
> [18468.571485] LR is at tegra_dc_irq+0x11c/0x130

I don't think I've ever seen this. It looks like there could be a very
subtle regression here, though. Can you try expanding the spin_lock in
tegra_dc_finish_page_flip() to encompass the whole function? Something
like the attached patch?

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename=patch
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 054a79f143ae..3c1553eb9df6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -658,8 +658,12 @@ static void tegra_dc_finish_page_flip(struct tegra_dc =
*dc)
 	unsigned long flags, base;
 	struct tegra_bo *bo;
=20
-	if (!dc->event)
+	spin_lock_irqsave(&drm->event_lock, flags);
+
+	if (!dc->event) {
+		spin_unlock_irqrestore(&drm->event_lock, flags);
 		return;
+	}
=20
 	bo =3D tegra_fb_get_plane(crtc->primary->fb, 0);
=20
@@ -669,12 +673,12 @@ static void tegra_dc_finish_page_flip(struct tegra_dc=
 *dc)
 	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
=20
 	if (base =3D=3D bo->paddr + crtc->primary->fb->offsets[0]) {
-		spin_lock_irqsave(&drm->event_lock, flags);
 		drm_send_vblank_event(drm, dc->pipe, dc->event);
 		drm_vblank_put(drm, dc->pipe);
 		dc->event =3D NULL;
-		spin_unlock_irqrestore(&drm->event_lock, flags);
 	}
+
+	spin_unlock_irqrestore(&drm->event_lock, flags);
 }
=20
 void tegra_dc_cancel_page_flip(struct drm_crtc *crtc, struct drm_file *fil=
e)

--mP3DRpeJDSE+ciuQ--

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUirz3AAoJEN0jrNd/PrOhz8cQALsU9/DB+NcIyG1zw93jled1
1ww6UpsOu+qZWhv4D7l1F61ccES+LeN6xtA5GdNCP84qNns4wvz7m6OqlRtgwSqb
wfMVktOCWMqbtM7euIk2y1Uyy/SnZ2kxnN9iCb/C0PAx4kDBhMu488bPQXe4PV0t
nmqBFByG6JB7GaQ5lNZSxmnD342tz3eHikaeR9RoZgKnIJvhS96P0HVGnhFchFuh
T7+KbDbTwRHbzBm2NSlb5HHL0kcVcVbnYTnRT/kla5trdX3YWRN19skOgTXTQKBo
UJzWK8xXF5P/TfMoSbWxosxLUVWtBcBd4xBea9RH7zmSG4/wXJ/HGZfsAbrrgwmn
jWMfSqdFATDwcfDJ4+aMyYS8Ii72vDxvnoyJ1KEaMk64pFzBPANfCSJBZzLRIBxg
O/n7oac+Lj8jocdV1JPw5YIUTsga9CPmmytmzue1j14nNS6ncPEDLEgFxvI/ePNc
9WtD+D1tWjyL0OAe/UwF2Ya0dkjJc6EurbcjpOoIOZYkfWuVRLaLeJILwa6AsZLM
yjdxJmpanmaKsQVREge8ljXlPSc5Mu/vG0HVNhaiLbOWKRquwou3T+QAefp+crNv
HrBxYoeT5K+jiM4xxcAth9IWmWARW/gX/QDImXJI6rvlvSZgXqUCgfVCJuEJX52l
vD69ikpKYIE4ZwKiXsa6
=pCa1
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
