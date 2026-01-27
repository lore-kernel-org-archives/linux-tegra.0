Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A531ED88
	for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536671; cv=pass; b=XALR5N+WyB87ZoM3nAnKWxpt49HMjSgdn44c2q+rwLiP7lkAU6BZr4N4WmM4NDeonoz1Y9IsgRPiLN3UJqEa91nNnYbsk5WhJcRaidjaZBsLgd6S5/y8HNq2sTc1PDmDlUCVDlaovjpW9WdFrnP+ujPGlVtQlTvByW4HNkRznWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536671; c=relaxed/simple;
	bh=KQhwtArAGYo3zak6CMn+nbk2UGZSRwi5JbXYqs3/Kdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quy3YrDFIHTUfdTuc2wOw0PlEj9eODBCBsfHWBrKE5XvzJXlG6j8cEojUPFn2wlpU1Hb5bxM34NKHibuin4VgY64xnopPYSNLdbtN+xDtZ+btnUtVwooNyrNO/1OkZB3dDJcwwlMfkSGKC80JbykHTPgLwfNChA19ZHgUGFoUxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTYuz6OF; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTYuz6OF"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso4095751e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 09:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769536667; cv=none;
        d=google.com; s=arc-20240605;
        b=YzyWTYUCnSx+MluH5Ec1zOvzvfPdygdbwrY2zLR7DT3dNi7IfGW35B8xKGQoU7cWbm
         k5Xjb9XXrbloVu24uDKD2cVkQ9AqWT88Tcog6Pu/soCpDztfHrOFl7YcCYF1tOublU5U
         8tt6I9PW5bIr29b8ga8S4N9cgQlcUp4KrT7a0vzDtdrbMDCAPrms3+3t0kzRNIvfRh51
         +I8BHW9T0FsanFt4/XzKAKzfNzxqn3POfYkC3f54sbPBsKsu5N2YZ1VWfV0Eg2xfdmdU
         VOBt9ZvMZR1LDvuZvSj7cVP7k+94NlmSXquQLU815FiTIAP8YYeeY9/H3Ckvjzvy9GV5
         w2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
        fh=K2pdsee0Z60rHReZcE8BCW1TEPeXodUcj8LFWyXQEvw=;
        b=SEu5uIvCKhyfkN0jQIyJpKdvoio0TNg4NbJa2m9lCCj2aHRpIrJCsrtmQLI/8gwT9q
         YXPkVKrDlNaTx8qBlYHDMzWLbonl3uMzmotclIKtKSp8w1JhbRut0+Ogj6/lwx9tlRBT
         dqLzstpFSD9fWmLr2vND/a58Frnj8O+SJpShfW6CUgo79xzkDHxjUJopSV/QbBVusLQy
         lg1vbFF6d/nrqrNtWR/vCGa+/03MphClLdp4Ob8fgSGUIJL5ibq8qeQRk2wiQfHUtgX7
         U8fDzsqtZXCXTlHdyUSdOUEhgg10oDOXcfWv59wQ0lplKCNgW7SnLD0eKL1/s00zeR01
         djPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769536667; x=1770141467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
        b=lTYuz6OF5b0Ix1T2Ktrz2fnSu+JUQTqj2Rl7Sth0E9yTTXGRB1K8CdoO69h7jvKK2Z
         oNoozXv79kknwT0QtZL6B8ZI5SDI2sN7mf16K3QHPV5ON9w++yMv0wJ+ZEHFa2tfRobl
         MvthMmPDL4gT/yL05m4BKFtTfriUXFRcgbCEbO511XIxRw8pFbklRO0SR7lIUcNns7ca
         xwOeg1j28jaTRUXxlZCBG37xqzQbaWwOVokZx0nv1RrlTW7spsV34peo0EXeocLHvJTA
         nac96qHcUYsJ+hfRfxFKSIMTpeoimd6/VTK0kfmwNuLENrPAKyRPUsx8uzGLOywgPcY1
         HLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769536667; x=1770141467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=luUIdgYgqij5sTyQIbDJzuI4VY3u9KXYKcnNYtE3tiw=;
        b=rL+lDx3kCeEDXhvWm/MgNFlizYJl3OyYa89Im7f0qFVKGC4QCWl4PnMzzPgzVU7SBH
         c+mof2mc2RudAycEZFgc/nKe5SpKltBux9kJ+svXevx/D32TjFy0ctYx/aFLiePmTPZZ
         gUDHCIYEMj8OVktuPyqmH4Ayari6ffelGeFvWPt6n4N+hVyPEl8Uj3GKqVesctgIMnGa
         9uVBtw34jYyjJPY9plw9Xy56AuK3inXihS6ouVnvuvK12MZ2mJFKIBNsUdoZnftFpmh7
         vMPOethxWaMmgTG3Nv9+NavCvP5t2XuJdDk3J4h7y6OfBzd2Fk4GT7SgocVdaf7CvtL6
         GcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8mb7Gqcr4957w2d6kdm/ex0hhNVIDLevryuKbYtz3C8Ali8isZS+dM46DvogxOFORQt4GGC0VcdXXLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/SrFDCcwLUen/Y1xrFDBDL9CbhxBsRVfnw3DLZ+YPnszUAMp
	/A1qtBl0/oMcRfqrhWTHLr9MViYdz1ZFcxJsPOK/SgNYL5twxyWja2Qymp2UbvuVWX0+n2EbECY
	3T3WvlQVzvT/0twTho2U7fpogODjOY0c=
X-Gm-Gg: AZuq6aIp1YWQcyknnIN9FqykpsBlb4jUfVHTc+WBsVYeQKZbBWcpRJiT3dSSyK4ksDD
	lfDNnj+MF742nygbakiarK8/AmKymSNNHDntU6KFTwu0gzbOLBwZjU5y3x8Q7c+nSuL7PLGZzFY
	5tQ1t+t4aXb1Uz3w1c68uyidmaw9mI1OsVpm+6wSHzYIARDKl97nR/UGqcJZbmk/G88ybfkMKuW
	oRHBxXuuQ81ibLRULnP4VBhr4G2RQyORQHy9lrHhYssuaKyacVF/U2vh+SeyGBgbd8e8u/uwCtp
	2M6e22+teBstMTN0w5mHplGYwaq0NyHdz46+D+hCKBXrlW/g66Cszw7G
X-Received: by 2002:a05:6512:1394:b0:59e:15a:d704 with SMTP id
 2adb3069b0e04-59e04015669mr1310663e87.13.1769536666875; Tue, 27 Jan 2026
 09:57:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
 <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com> <4318175.BddDVKsqQX@senjougahara>
 <aXiSMlP-UKmrFKL7@orome>
In-Reply-To: <aXiSMlP-UKmrFKL7@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 27 Jan 2026 11:57:35 -0600
X-Gm-Features: AZwV_QiONhUrH9mW8fgK-XzM6A67xrmteS-4dD_epS4cP1D-YSc2IOYPoDWt8y0
Message-ID: <CALHNRZ-ZxBmbCNGyq77TWcNQwo9qhrB0znfRnsj7zy9GVE=jtA@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Kurt Kiefer <kekiefer@gmail.com>, 
	Jasper Korten <jja2000@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 4:32=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Jan 27, 2026 at 01:12:54PM +0900, Mikko Perttunen wrote:
> > On Thursday, January 22, 2026 2:08=E2=80=AFAM Kurt Kiefer wrote:
> > >
> > > > On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > > >
> > > > On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail=
.com> wrote:
> > > >>
> > > >> Hi all,
> > > >>
> > > >> On 11/4/25 19:12, Aaron Kling wrote:
> > > >>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.re=
ding@gmail.com> wrote:
> > > >>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> > > >>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > >>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 R=
elay wrote:
> > > >>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>>>>
> > > >>>>>>> Without the cmu, nvdisplay will display colors that are notab=
ly darker
> > > >>>>>>> than intended. The vendor bootloader and the downstream displ=
ay driver
> > > >>>>>>> enable the cmu and sets a sRGB table. Loading that table here=
 results in
> > > >>>>>>> the intended colors.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>>>> ---
> > > >>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
> > > >>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++=
++++++++++++++++++
> > > >>>>>>>  2 files changed, 219 insertions(+)
> > > >>>>>> What does "darker than intended" mean? Who defines the intenti=
on? How do
> > > >>>>>> we know what the intention is? What this patch ultimately seem=
s to be
> > > >>>>>> doing is define sRGB to be the default colorspace. Is that alw=
ays the
> > > >>>>>> right default choice? What if people want to specify a differe=
nt
> > > >>>>>> colorspace?
> > > >>>>> I reported this issue almost a month ago. See kernel lore [0] a=
nd
> > > >>>>> freedesktop issue [1]. The pictures in the latter show what nvd=
isplay
> > > >>>>> looks like right now. It's nigh unusably dark. When booted into
> > > >>>>> Android with a tv launcher that has a black background, as is d=
efault
> > > >>>>> for LineageOS, it is really hard to read anything. Is it correc=
t as a
> > > >>>>> default? Well, cboot hardcodes this, so... presumably? It would=
 be
> > > >>>>> more ideal to expose this and csc to userspace, but I'm not sur=
e if
> > > >>>>> drm has a standardized interface for that or if tegra would hav=
e to
> > > >>>>> make something vendor specific. I think that would be a separat=
e
> > > >>>>> change concept compared to setting this default, though.
> > > >>>> The reason I'm asking is because I don't recall ever seeing "bro=
ken"
> > > >>>> colors like you do. So I suspect that this may also be related t=
o what
> > > >>>> display is connected, or the mode that we're setting.
> > > >> I have tried it on both a MacroSilicon HDMI capture card and an Ar=
zopa
> > > >> Z1FC 1080p portable monitor and run into the same darker colors. B=
oth
> > > >> have in common that they use HDMI which seems to line up with what=
 Aaron
> > > >> is reporting. I do not have an eDP display to test or another carr=
ier
> > > >> board with a different display out to test.
> > > >>>> It could perhaps
> > > >>>> also be related to what infoframes we're sending and how these a=
re
> > > >>>> supported/interpreted by the attached display.
> > > >>>>
> > > >>>> All of that is to say that maybe this looks broken on the partic=
ular
> > > >>>> setup that you have but may works fine on other setups. Changing=
 the
> > > >>>> default may fix your setup and break others.
> > > >>> Do you have a device set up so you can check? Or does the regress=
ion
> > > >>> test bench have a display that can be forwarded?
> > > >>>
> > > >>> My current setup is a rack of units plugged via hdmi to a kvm whi=
ch is
> > > >>> then plugged to a pikvm. I also observed this issue before I had =
this
> > > >>> setup, plugged directly to a 1080p monitor. I have not checked
> > > >>> displayport. I can cycle through a couple other displays without =
this
> > > >>> patch to see if I get any other result. I am fairly certain I hav=
e
> > > >>> consistently seen this issue since I started trying to work with
> > > >>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it wo=
rk to
> > > >>> allow for a bisect.
> > > >>>
> > > >>> I am in contact with one other person with a tx2 devkit, who
> > > >>> replicated the issue when I asked. Who plans to reply to this thr=
ead
> > > >>> with setup info later.
> > > >>
> > > >> For reference, I am said person. I have a Jetson TX2 Devkit that u=
ses
> > > >> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> > > >> additional patches applied by myself. I have personally noticed th=
e
> > > >> issue to at least be present on 6.14.5 and 6.17.4.
> > > >>
> > > >>
> > > >> I'm currently not at home to take screenshots with and without the
> > > >> submitted patch, but will be able to do it tomorrownight or friday=
.
> > > >
> > > > Any further thoughts from the maintainers on this patch? As far as =
I
> > > > know, this is an issue for all users, at the very least on hdmi.
> > > >
> > > > Aaron
> > > >
> > >
> > > I can confirm that I have the same issue on a DisplayPort output of t=
194.
> > > IMO, this patch will need to be reworked a bit to enable the CMU for =
this
> > > output as well. I hacked this change in for DisplayPort, and then it
> > > functioned as intended there as well.
> > >
> > > I've traced back to the reason this is necessary. The DC hub driver i=
s
> > > applying an sRGB degamma for every RGB plane (presumably for blending=
),
> > > and then nothing reapplies the EOTF later on. Without gamma correctio=
n
> > > in places where it is expected, images are going to look "too dark".
> > >
> > > Which does raise the point that there is an alternative implementatio=
n
> > > where we do not degamma RGB planes in the first place. But this may h=
ave
> > > unintended consequences when it comes to composition.
> > >
> > > The SOR does not appear to handle YCbCr outputs at this time, so enab=
ling
> > > the CMU assuming an sRGB EOTF seems like a reasonable path here, to m=
e.
> > >
> > > Kurt
> >
> > I tested this patch locally and did some investigation. Can confirm
> > that on my Jetson AGX Xavier, this patch (or disabling degamma) fixes
> > the color output.
> >
> > The colorspace the display expects from the incoming data is specified
> > in the AVI infoframe. This is generated in
> > tegra_sor_hdmi_setup_avi_infoframe, which calls into
> > drm_hdmi_avi_infoframe_from_display_mode, which leaves a lot of fields
> > set at the default.
> >
> > Currently we're advertising:
> > * colorimetry =3D no data -> for HD resolutions, use Rec. 709 primaries=
.
> > These are the same as sRGB.
> > * itc =3D false -> NOT IT content.
> >
> > My understanding (based on some LLM research and otherwise) is that
> > this is likely to result in the display expecting Rec. 709 colors with
> > Rec. 709 gamma. sRGB gamma is slightly different, and setting itc =3D
> > true would hint the display towards using sRGB gamma.
> >
> > However, what seems clear to me is that the display would be expecting
> > nonlinear data, so enabling gamma conversion at the output LUT seems
> > correct to me. So this patch would be a clear improvement (with the
> > fixes already discussed).
>
> I think ideally we want to hook this up to the DRM color management
> facilities, so that it can both be properly reported and configured
> at runtime.

That would be ideal yes. But I don't have nearly the knowledge of DRM
or nvdisplay to wire this up. Is there someone at Nvidia that can make
time to do so?

> Obviously we also want to make sure that the output pixels match what
> is advertised via the AVI infoframe. Looks like there's concensus that
> enabling the output LUT is the correct way to do that.

If more fully featured CMU support can't be done in a reasonable
timeframe, I can address the earlier review comments and coordinate
with Kurt to replicate this for DP, then send a v2.

Aaron
