Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21C28D84F;
	Wed,  8 Oct 2025 01:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759887495; cv=none; b=PLClnr+yGP/RpjmEzex2u5amHETOlp/6NRJn3uA8xvEmC4TloB8lqEmaVvwMewsuLecPHT/xWNYK8APx0kYQ0WxdfmsEsTFzLAHA0Ht9i1UzecRm2QxX+dZCxwFKEHLTOd+R/dKwaREAgKgMEO0QYJt3uHqbVkcSSml+9kVGZ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759887495; c=relaxed/simple;
	bh=g9HKatffLmG7PZQzs7MEvfVFFeFvciAqfzfnc7tu7pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btZQYDF1IYSFomWdMXjcwW6d7d/uNT6bhF6QumK0krfxR5P4vclaHhG3+sM+IOC6LY36Npanaisi6Tdn8yKBLbk3XczA+vOzy82o277eue+AGzVfmC9z9fy4IpwFeoXSQ3acYOYFGRAyp8oJQMM8i+fSCp3jS6VTqnsEJkM89nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHSf5Uj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHSf5Uj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED1EC4CEF1;
	Wed,  8 Oct 2025 01:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759887493;
	bh=g9HKatffLmG7PZQzs7MEvfVFFeFvciAqfzfnc7tu7pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHSf5Uj926ugwsG9Rn6jt2cBtFtu+AtRIRoqF+rz047j4GZ/y2ofcRmbk3B+azBPr
	 uYqvq5Iv65Ae4qpDrJh24qZXGZzIpN2QSOMmbKcdc+D8ve/hTD1w/oAPyPuLRutsCi
	 h5I033Go4OIDSyU7oBgNKXKzLJrFlAZYbFT/kT8TBewVXQPU7Xkxo8jwBaC8fg59uY
	 DdrM+jGI1q9Dqmc8TO8e6pbEmqzVZlvfSwy/Oy5qLy/Q88V1FN8HZNUPQsd3KyU6Rk
	 xx2Zhjb70Dy3EEkQjN6Z0synZrCxy51HZE8GtT3vevmzzDhHrob7EvltEykGDj3+3f
	 3kb1jhS3/zdXQ==
Date: Tue, 7 Oct 2025 20:38:12 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: properly document LG
 LD070WX3 panel
Message-ID: <20251008013812.GA1911585-robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-2-clamor95@gmail.com>
 <CAD=FV=Vd=muLeMJYszC2SqRBThN=Srm_bKXBEmjjqND7bqHo2g@mail.gmail.com>
 <CAPVz0n23qNrnyP7ttchaCoLit=gBm_++7RX7B8MxR_nx+8LGHw@mail.gmail.com>
 <CAD=FV=UCcQ1AweLwNucYP8kNHx+K1UF=VbEZdqE4hXN=bHqGuQ@mail.gmail.com>
 <20251006221308.GA653118-robh@kernel.org>
 <CAPVz0n0VfjW_=E9oM0FAhjqzAQnPXaL40gDqOsz2mwBaaA_0Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0VfjW_=E9oM0FAhjqzAQnPXaL40gDqOsz2mwBaaA_0Fg@mail.gmail.com>

On Tue, Oct 07, 2025 at 08:24:06AM +0300, Svyatoslav Ryhel wrote:
> вт, 7 жовт. 2025 р. о 01:13 Rob Herring <robh@kernel.org> пише:
> >
> > On Thu, Oct 02, 2025 at 02:35:42PM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Mon, Sep 29, 2025 at 10:03 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > > >
> > > > вт, 30 вер. 2025 р. о 06:12 Doug Anderson <dianders@chromium.org> пише:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, Sep 29, 2025 at 7:25 AM Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > > > > >
> > > > > > LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
> > > > > > clearly is not. Address this by adding the proper schema for this panel.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  .../bindings/display/panel/lg,ld070wx3.yaml   | 60 +++++++++++++++++++
> > > > > >  .../display/panel/panel-simple-dsi.yaml       |  2 -
> > > > > >  2 files changed, 60 insertions(+), 2 deletions(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..0a82cf311452
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3.yaml
> > > > > > @@ -0,0 +1,60 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: LG Corporation 7" WXGA TFT LCD panel
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: panel-common.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - const: lg,ld070wx3-sl01
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  vdd-supply: true
> > > > > > +  vcc-supply: true
> > > > > > +
> > > > > > +  backlight: true
> > > > > > +  port: true
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - vdd-supply
> > > > > > +  - vcc-supply
> > > > >
> > > > > I suspect you'll get a NAK here because you're not preserving backward
> > > > > compatibility for existing device trees. While there can sometimes be
> > > > > reasons to do that, you'd need to provide a very strong justification.
> > > > >
> > > > >
> > > > > It seems like instead of breaking compatibility you could just have
> > > > > two supplies:
> > > > >
> > > > > * power-supply - The name for the "dvdd" supply.
> > > > > * avdd-supply - The name for the "avdd" supply.
> > > > >
> > > > > ...and then you make both of them not "required". Maybe you'd add some
> > > > > documentation saying that things might not work 100% correctly if they
> > > > > weren't provided but that old device trees didn't specify them?
> > > >
> > > > Schema describes hardware. If it does not (and in this case it clearly
> > > > DOES NOT), then such schema should be adjusted according to hardware.
> >
> > The priority is:
> >
> > 1) ABI
> > 2) describe h/w accurately
> >
> > IMO, if there are 2 rails on the h/w and you have 2 supplies in the DT,
> > then you have described the h/w. names are less important.
> >
> > > > If there are any users of such binding, they should be adjusted too
> > > > (third commit of this patchset does exactly that). Panel datasheet is
> > > > explicit, panel has ONLY vdd supply and vcc supply, names are taken
> > > > from there too.
> > >
> > > I'm more than happy to defer to DT people on this, but the general
> > > argument is that "device tree" is supposed to remain forever forward
> > > compatible. In other words, someone could have taken a snapshot of the
> > > "tegra114-tn7.dts" device tree at any point in time and then shipped
> > > it in some BIOS. Presumably the old "tegra114-tn7.dts" (for some
> > > reason) managed to init the panel properly in the past and the idea is
> > > that there should still be a way to init the panel with the old device
> > > tree now.
> > >
> > > Obviously, that's an ideal version of the world and sometimes
> > > hard/impossible to make a reality, but it's supposed to be what we
> > > strive for.
> > >
> > > >From a more practical standpoint, the dts changes and code changes
> > > will go through different trees and so making them mutually depend on
> > > each other can leave people broken if they happen to have one patch
> > > but not the other.
> > >
> > > I suppose one way to handle this (if DT people like it) is to keep the
> > > bindings the way you have it but then add some layer of backward
> > > compatibility in the driver. It will mean that anyone with the old DTS
> > > would officially not "validate" properly against the new bindings, but
> > > I think that could be OK as long as it was explicitly mentioned in the
> > > commit message. Obviously, though, DT bindings reviewers would have
> > > the last word there...
> >
> > That's fine, but then I prefer we keep 'power-supply' as deprecated.
> > Then if we ever validate that drivers only use documented properties,
> > it would pass. We already check drivers use documented compatible
> > strings, so that wouldn't be too hard to do.
> >
> 
> Sure, but ATM there is only one user of this compatible in the
> mainline Linux kernel, which is Nvidia tablet Tegra Note 7 and:
> 
> 1. Node used in its tree is addressed in the third commit of this patchset
> 2. Its panel is broken anyway since it cannot init properly if
> bootloader does not leave a pre-inited panel, it cannot suspend
> properly and it has a loose regulator which relies on always-on
> property rather then being hooked to the panel.

Then put all this justification in the commit message.

> I can assure you that besides me there seems to be no one interested
> in this tablet.

Okay, then it is on you if anyone does care.

Rob
