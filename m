Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793976807;
	b=0hxRKdZl3/gMtQyOPKNq6IaopEyRAcxaPYWeKehwSWF47t2RHKxlPAZexREvEG040H5z
	 5t+JubuBV3jbY+FOD8Erq1ZJmytJgF/0TX0zRLCwMRmFR7dV3NkfrcoSKFM/IFoKHJ/Qh
	 uYQnXrolwViTq8vURVTFeC0zOmUwzlwIabi18JwQuYkxWlUsYhmGo1DFFFFb/o4xI5OEc
	 i4oV5GncY43/VU67UIcVns4SaoU/uI9I7qyYg1OFO7JBA+gE3JV5S0B4DOFDV2d0zyqcu
	 Eck9rHhDxe6e7fmgg7NqsN2pSMFNVtjwfmPxL1SdeMsq2rVW41U6677Q5IWP898iFsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
	b=pcjSUYWFsKoCANFwui6d/aUmbutN4IOybpJFgPi/KIUrYp8NvqJUwBrrZXA15ui7GLd4
	 KrXKnQ6D7yIw0/4eAUezx8DRf9Ug5Rh1nPIU0ndS76sFhYIQCbNnQxsUq8bTZdUGzCHeP
	 ErVArphx4ZXYLb+fMXCX++y0PVVldeGApElFYpx7r93xKKXn1S0SUaUtVlNOW/56+5doW
	 u8lo83uoBnSu/3UdsOJlN4yqgivVnQwHVAdXfWw//0WZWiPfy6+MaKmXttgQpQewcU431
	 VnOxLFSXujQzZCmwX7MxPqbCsmS80OugUUE3MG+1KAFgqJH+CdFisRsmcE2bo0FKqRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+w7wZXC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F4A606A326
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F4A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+w7wZXC
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1203027eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 Nov 2026 06:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793976805; cv=none;
        d=google.com; s=arc-20260327;
        b=LgYq+s271xG0L8qKTHjC+j5hOkTGidUdotzS1wfWh1dEnAVdO9qf1eWp4Ns2SXbHkh
         hpKknQzcQpJ1jhIVgy9jiMjiyHAJA7Sci+K4NKf/qxxY5rdGlxn7oYci2ASI6/o1yUMb
         /WImKFQeNY28KQFlbANG/wr1q18qqASdEegD3SR+T0Da899+gJz91s5J2S81B9LsGtOB
         av4B0SoNtQ75i0B5vISC6sRG2vIz172QFuAK+dRSVTnxWUk+UVUx1fVJBZn38+/Ee8cL
         iQ9/z67OPDC0CCzH3BtLLHvafrvpeQWWBUW5BC0Qwknwabvdrp0aH7D8DQ7AKFCZwlkq
         H1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        fh=id4fYPf5CwmFQ7T0zPTt0HHos/n3DWv3jVDdw0ys3Hk=;
        b=B1Wcuzx8zlUazZy53oe2u/Hm5cnSTsOVgcMGfsbR26wG9c4iNExSXg86vEga4WQxre
         u7IaxbxSMGnpi9UwUL7WjXnYjeFSnSC3T8miogFENMEO5TLCa2PeVoLz9wq3bymgyZT5
         mNDHi8tHL/CCvmUGA+3gET8EG7DW7RKWYVikU4pBjCs7M8lnyoBBJ8zT+1fNjt+saV72
         Qo1/GjqgA2Ungl6vYYVHisZPU3NhQP3hfSZ9l5dFnfaKurtkBR0vl7F53Mfci3nUig0r
         uGm3Nmufrgt1a1SB84WyDnFKEs2YCzGB7na9iDv92snk8+GjrfHdlDJEXH0Wq2FyR57k
         W+GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976805; x=1794581605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        b=N+w7wZXCsxVvKWIJVTDi6n1bveOkBws28vYgRbMt8yDzWAoKrcsLIVBa4arqN932UH
         zVvhyVZkkJ9ZtCO0LNFdgff6vAPcvp9s31PQpCEn963LMTDM+4smmssn5m+fAk2HWl0q
         DIg4Gfizspa4mPCfT+9DwDnFvBXw72kzepqPLTQAHcYNbdbb7g4E27KyHOyJyJ8uVXaS
         3lH3rq6nWGtfzV0zRSgdBXdGSHDKY9eNGGMjJ2MuPlxCnLTN902qR+zZ+PEep4lZxcfa
         D7tMs9DdGtnKf7g2belO/AiRqAKZwXoRqUbtBmZxnBy8X6w3EqO2AGnca0qi6kwJ55Ga
         36pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976805; x=1794581605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3F6W8fOlf3fpvyPLowDGKWbhRmQeKkGPlTMYZcu+3U=;
        b=NwtaT7w+UXXLiVVp3WkFqRhQC9g6/twR+Kdl1GNcZFoaOPVR5EW4icYew+ZWbRrkMt
         SiTVAN6Ao5+jMM2N4pb2srZKF1/XbpxmkGrNPdaMlGbibGcrOX/XnojaKD2CqmYtG6Z4
         Avp8ilEY0cS6v1fu9dno1hm9jvIQ3q6HZGndASq+XeXljg6oaE7mPhOgxuEkTy3ZoWvj
         3MKfIyWeO31S9CVCOdSKjB11OgZ4d+1HeNXQkPio5po/AgzcDbE+dWXxMzphObBJN7eT
         Nz3/bh7xEZXWbXgnNdITKpFZKxP5Am5dkEE1Ml0G9+SsyIg2UyNUgCpOcEA66hhgHB3b
         kapA==
X-Forwarded-Encrypted: i=1; AL+hErFNDQz/W48hZ8YJj4Ko68Ssv6M/HJMA2+vfyjksQK2pNTJrZ7U1mZVpDYFrQUJ0IWk+2YdKlMYIYu9CuA==@vger.kernel.org
X-Gm-Message-State: APuU4Z94AqaOV6C//ijKw+QYHuW9ZJS2ZFPBkFrO4zPBspLRlDbXs44p
	V6nYyltDAr+NqeXgBiH1hJZQ+x9NjsI0mUUtTL7jCOVY7DdA5tMvs5n54jr1nPjMZ1TUFvcfTXd
	NIiMVvKG8bFaylyvDbsxEco3xsJtHpr8=
X-Gm-Gg: AYBFou2u5yPHt+43yvsGSa1LTiwXQCFuOgI3E1PLED0Xo9Tz3y4YDrQx3qH51s2hEuh
	e32cokFh+VLftVtgwkzJgOIDar8AK2G00/2eXn9F9tx4NXEF+bxi1b57/W4oxj43QKInRfSRPDJ
	xw2gErRcrI7SPhuv7Zu0CRzjk0JC4sb+w+qZLEUy3AcXuTeX6PsMJzy4LDDSSgQxhgw1vC+K86M
	XGcZ+Oa9EFqaBHON18S5dFzT54ZjrnwFr57UhfFk9ET+zkiAMoVuY3gHvrHJ2Kz5hXEzBOV5T1S
	aauMfF0JTkjEvtdBb0HQmQAQkTUY7cPyxfP3RX3p4zVyelb+kcvDl5a2vJWQK2Z+oXJohLYYqX2
	tjbtgUmfVHqrxxBoUeHkRcc9f9cC1NJAwqaKjgRWJY6YARbzHKVXXwrbG1xlgAs9OhzwBO+G/MI
	sA8aotW7fkt1o9DiE+Fv2PsbG2EXuVMg==
X-Received: by 2002:a05:693c:885b:b0:36e:53bc:467d with SMTP id
 5a478bee46e88-36f6f98f02amr4078732eec.0.1793976804968; Fri, 06 Nov 2026
 06:53:24 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-11-clamor95@gmail.com>
 <au3fy-xiCqgSTB49@orome>
In-Reply-To: <au3fy-xiCqgSTB49@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:53:12 +0200
X-Gm-Features: AclHuK-yR8MI_xE6GVCmUnrGxNX3AB_Zl6JW9KYWDsB56-ZDI0Rnv_bCRe7tykM
Message-ID: <CAPVz0n2EwNnRFiJGXFFEnVO_TSoCg6D7E01Gitqs3nyeza78Qw@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] drm/tegra: Add support for 8-bit CPU interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:38=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:10PM +0200, Svyatoslav Ryhel wrote:
> > The display controller in Tegra20/30 SoCs features an 8-bit SPI interfa=
ce
> > that closely resembles the MIPI DBI Type B protocol and is referred to =
as
> > '8-bit CPU'. Each display controller provides two such interfaces, whic=
h
> > can be used to send MIPI DCS commands to initialize and control the pan=
el
> > while image data is transmitted via 16/18/24-line RGB.
> >
> > The '8-bit CPU', although being the DC interface, is modeled using a
> > bridge framework for flexibility and convenience. This implementation d=
oes
> > not change the existing codebase besides registering the bus.
> >
> > Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # DC command tran=
sfer
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/Kconfig  |   1 +
> >  drivers/gpu/drm/tegra/Makefile |   1 +
> >  drivers/gpu/drm/tegra/dbi.c    | 576 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/dc.c     |   4 +
> >  drivers/gpu/drm/tegra/dc.h     |   3 +
> >  5 files changed, 585 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tegra/dbi.c
> >
> > diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kcon=
fig
> > index 8a3b16aac5d68..6f57fd3985edc 100644
> > --- a/drivers/gpu/drm/tegra/Kconfig
> > +++ b/drivers/gpu/drm/tegra/Kconfig
> > @@ -12,6 +12,7 @@ config DRM_TEGRA
> >       select DRM_BRIDGE_CONNECTOR
> >       select DRM_DISPLAY_DP_AUX_BUS
> >       select DRM_KMS_HELPER
> > +     select DRM_MIPI_DBI
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL
> >       select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> > diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Mak=
efile
> > index e399b40d64a1d..ae7fccb3d6421 100644
> > --- a/drivers/gpu/drm/tegra/Makefile
> > +++ b/drivers/gpu/drm/tegra/Makefile
> > @@ -18,6 +18,7 @@ tegra-drm-y :=3D \
> >       hdmi.o \
> >       mipi-phy.o \
> >       dsi.o \
> > +     dbi.o \
> >       sor.o \
> >       dpaux.o \
> >       gr2d.o \
> > diff --git a/drivers/gpu/drm/tegra/dbi.c b/drivers/gpu/drm/tegra/dbi.c
> > new file mode 100644
> > index 0000000000000..32d390f64ddbd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tegra/dbi.c
> > @@ -0,0 +1,576 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nvidia Tegra20/30 MIPI-DBI Type B host driver
> > + *
> > + * Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/kernel.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/string.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> > +#include <drm/drm_of.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include "dc.h"
> > +
> > +enum tegra_dbi_dc_signal {
> > +     TEGRA_DBI_COMMAND,
> > +     TEGRA_DBI_DATA
> > +};
>
> These look like register offsets for sending DBI commands, so maybe just
> use defines for them?
>

Check v5 and talk to Mikko!

> > +
> > +enum tegra_dbi_iface {
> > +     TEGRA_DBI_INTERFACE_PRIMARY,
> > +     TEGRA_DBI_INTERFACE_SECONDARY,
> > +     TEGRA_DBI_INTERFACE_MAX
> > +};
>
> The only place where this seems to be used is in the definition of the
> two interfaces. But in those cases PRIMARY and SECONDARY match the index
> into the array and MAX is the size of the array, which can be determined
> dynamically. Drop this.
>
> > +
> > +#define TEGRA_DBI_DATA_PINS_MAX                      8
> > +#define TEGRA_DBI_DEFAULT_BUS_WIDTH          24
> > +
> > +struct reg_entry {
> > +     u32 offset;
> > +     u32 value;
> > +};
> > +
> > +static const u32 tegra_dbi_pin_regs[] =3D {
> > +     DC_COM_PIN_OUTPUT_ENABLE(0),
> > +     DC_COM_PIN_OUTPUT_ENABLE(1),
> > +     DC_COM_PIN_OUTPUT_ENABLE(2),
> > +     DC_COM_PIN_OUTPUT_ENABLE(3),
> > +     DC_COM_PIN_OUTPUT_POLARITY(0),
> > +     DC_COM_PIN_OUTPUT_POLARITY(1),
> > +     DC_COM_PIN_OUTPUT_POLARITY(2),
> > +     DC_COM_PIN_OUTPUT_POLARITY(3),
> > +     DC_COM_PIN_OUTPUT_DATA(0),
> > +     DC_COM_PIN_OUTPUT_DATA(1),
> > +     DC_COM_PIN_OUTPUT_DATA(2),
> > +     DC_COM_PIN_OUTPUT_DATA(3),
> > +     DC_COM_PIN_OUTPUT_SELECT(0),
> > +     DC_COM_PIN_OUTPUT_SELECT(1),
> > +     DC_COM_PIN_OUTPUT_SELECT(2),
> > +     DC_COM_PIN_OUTPUT_SELECT(3),
> > +     DC_COM_PIN_OUTPUT_SELECT(4),
> > +     DC_COM_PIN_OUTPUT_SELECT(5),
> > +     DC_COM_PIN_OUTPUT_SELECT(6),
> > +};
> > +
> > +struct tegra_dbi_priv {
> > +     struct device *dev;
> > +     struct tegra_dc *dc;
> > +
> > +     struct mipi_dbi dbi;
> > +     struct mipi_dbi_host dbi_host;
> > +
> > +     struct drm_bridge bridge;
> > +     struct drm_bridge *next_bridge;
> > +
> > +     const struct tegra_dbi_interface *interface;
> > +     struct reg_entry com_pin_backup[ARRAY_SIZE(tegra_dbi_pin_regs)];
>
> You can just make this a u32 array since you're always iterating over
> that tegra_dbi_pin_regs array anyway and can get the offset from there.
> No need to duplicate that data into another set of variables.
>

Actually, decent.

> [...]
> > +static void tegra_dbi_pin_set(struct tegra_dc *dc, const struct tegra_=
dbi_pin *pin, bool value)
> > +{
> > +     u32 val =3D BIT(pin->pos + 1); /* unmask is 1 bit above position =
*/
> > +
> > +     if (value)
> > +             val |=3D BIT(pin->pos);
> > +
> > +     tegra_dc_writel(dc, val, pin->reg);
> > +}
>
> So the PIN_UNMASK exists for all registers. In that case, the definition
> should probably not be intermixed like it was in that header "refactor
> and expand" patch.
>
> > +
> > +static void tegra_dbi_write(struct tegra_dbi_priv *priv,
> > +                         enum tegra_dbi_dc_signal signal, u8 value)
> > +{
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     const struct tegra_dbi_interface *interface =3D priv->interface;
> > +
> > +     tegra_dbi_pin_set(dc, &interface->dc, signal);
> > +
> > +     tegra_dbi_pin_set(dc, &interface->cs, 0);
> > +     tegra_dbi_pin_set(dc, &interface->rw, 0);
> > +
> > +     for (int i =3D 0; i < TEGRA_DBI_DATA_PINS_MAX; i++)
> > +             tegra_dbi_pin_set(dc, &interface->data[i], field_get(BIT(=
i), value));
> > +
> > +     tegra_dbi_pin_set(dc, &interface->cs, 1);
> > +     tegra_dbi_pin_set(dc, &interface->rw, 1);
> > +
> > +     udelay(10);
>
> Umpf... I guess we're effectively bit-banging here, but a udelay() here
> is potentially a lot of spinning time. If I recall correctly this can
> end up being called a lot, on the order of 100 or so times during panel
> initialization.
>

Aaaaaaaaaand? What you propose?

> > +
> > +static void tegra_dbi_atomic_enable(struct drm_bridge *bridge,
> > +                                 struct drm_atomic_commit *state)
> > +{
> > +     struct tegra_dbi_priv *priv =3D bridge_to_tegra_dbi(bridge);
> > +     struct drm_bridge *next_bridge =3D priv->next_bridge;
> > +     struct tegra_dc *dc =3D priv->dc;
> > +     u32 value;
> > +
> > +     value =3D tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
> > +     value &=3D ~DISP_CTRL_MODE_MASK;
> > +     tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
> > +
> > +     /* Disable all options except cursor if enabled */
> > +     value =3D tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
> > +     value &=3D CURSOR_ENABLE;
> > +     tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
> > +
> > +     tegra_dc_commit(dc);
> > +
> > +     tegra_dc_writel(dc, V_PULSE1_ENABLE, DC_DISP_DISP_SIGNAL_OPTIONS0=
);
> > +     tegra_dc_writel(dc, PULSE_POLARITY_LOW, DC_DISP_V_PULSE1_CONTROL)=
;
> > +
> > +     tegra_dc_writel(dc, PULSE_END(1), DC_DISP_V_PULSE1_POSITION_A);
> > +     tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_B);
> > +     tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_C);
> > +
> > +     value =3D 1 << FRAME_INIT_SEQ_CYCLES_SHIFT |
> > +             DC_SIGNAL_VPULSE1 << INIT_SEQ_DC_SIGNAL_SHIFT |
> > +             INIT_SEQUENCE_MODE_PLCD | SEND_INIT_SEQUENCE;
> > +     tegra_dc_writel(dc, value, DC_DISP_INIT_SEQ_CONTROL);
> > +
> > +     /* Init cycle 1: WRITE_MEMORY_START, set LCD_PCLK and COMMAND */
> > +     tegra_dc_writel(dc, MIPI_DCS_WRITE_MEMORY_START, DC_DISP_SPI_INIT=
_SEQ_DATA_A);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_B);
> > +     tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_C);
> > +     tegra_dc_writel(dc, BIT(12) | BIT(14), DC_DISP_SPI_INIT_SEQ_DATA_=
D);
> > +
> > +     /* Set LDC pin to V Pulse 1 */
> > +     value =3D tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
> > +     value &=3D ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDC);
> > +     value |=3D PIN_OUTPUT_SELECT_F4(PIN_OUTPUT_SELECT_LDC);
> > +     tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
> > +
> > +     value =3D SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +             SC0_V_QUALIFIER(SC_V_QUALIFIER_VACTIVE) |
> > +             SC0_H_QUALIFIER(SC_H_QUALIFIER_HACTIVE);
> > +     tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> > +
> > +     value =3D tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
> > +     value &=3D ~BASE_COLOR_SIZE_MASK;
> > +
> > +     switch (priv->bus_width) {
> > +     case 16:
> > +             value |=3D BASE_COLOR_SIZE_565;
> > +             break;
> > +     case 18:
> > +             value |=3D BASE_COLOR_SIZE_666;
> > +             break;
> > +     case 24:
> > +             value |=3D BASE_COLOR_SIZE_888;
> > +             break;
> > +     default:
> > +             WARN(1, "%u bus width not supported\n", priv->bus_width);
> > +             value |=3D BASE_COLOR_SIZE_888;
> > +             break;
> > +     }
> > +
> > +     tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
> > +
> > +     /*
> > +      * Backup registers before unshadowing since actual register valu=
es
> > +      * may differ and their state backed up now is the correct one.
> > +      */
> > +     for (int i =3D 0; i < ARRAY_SIZE(tegra_dbi_pin_regs); i++)
> > +             priv->com_pin_backup[i].value =3D tegra_dc_readl(dc,
> > +                     priv->com_pin_backup[i].offset);
> > +
> > +     /* Unshadow to set up command and data pins */
> > +     tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
> > +
> > +     if (priv->interface->interface)
> > +             tegra_dbi_init_secondary_interface(priv);
> > +     else
> > +             tegra_dbi_init_primary_interface(priv);
>
> Maybe hook this into priv->interface directly using a .init() callback.
> That way you don't need to branch based on interface index here.
>

Interesting idea.

> [...]
> > +int tegra_dc_dbi_probe(struct tegra_dc *dc)
> > +{
> > +     struct device *dev =3D dc->dev;
> > +     struct device_node *dbi_np __free(device_node) =3D
> > +             of_get_available_child_by_name(dev_of_node(dev), "dbi");
> > +     struct mipi_dbi_device *dbidev;
> > +     struct tegra_dbi_priv *priv;
> > +     struct device_node *np;
> > +     u32 reg;
> > +     int ret;
> > +
> > +     /* Missing node means that DBI is not used, continue DC probe */
> > +     if (!dbi_np)
> > +             return 0;
>
> Maybe this should have an extra check to see if dbi_np is available.
> That would help create this node in a DTSI file and just keep it
> disabled by default.
>

This is redundant. DBI is quite rare and does not need to be
specifically defined in dtsi

> > +
> > +     priv =3D devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge=
,
> > +                                  &tegra_dbi_funcs);
> > +     if (IS_ERR(priv))
> > +             return PTR_ERR(priv);
> > +
> > +     priv->dc =3D dc;
> > +     priv->dev =3D dev;
> > +
> > +     ret =3D of_property_read_u32(dbi_np, "reg", &reg);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get reg\n");
> > +
> > +     if (reg !=3D 0 && reg !=3D 1)
> > +             return dev_err_probe(dev, -EINVAL, "Wrong reg value: %d\n=
", reg);
>
> Maybe sort these before the call to devm_drm_bridge_alloc()?
>

Fair point.

> Thierry
