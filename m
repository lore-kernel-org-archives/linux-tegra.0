From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v4 09/11] ARM: tegra: add support for warm reset GPIO
Date: Wed, 11 Feb 2015 09:17:45 -0800
Message-ID: <CAL1qeaHHt+5Ak+rOkP1QF=+BvaiiAtfrKUuBSq+LL=1kqfKngw@mail.gmail.com>
References: <1423667220-1062-1-git-send-email-tomeu.vizoso@collabora.com>
	<1423667220-1062-10-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423667220-1062-10-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Simon Glass <sjg@chromium.org>, Dylan Reid <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Paul Walmsley <paul@pwsan.com>, Eduardo Valentin <edubezval@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tomeu,

On Wed, Feb 11, 2015 at 7:06 AM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>
> Allow for a warm reset GPIO to be passed to the PMC driver via DT
> which will be used to reset the system instead of writing to PMC_CTRL.
> The GPIO will be asserted at reset time and, if this fails to reset
> the system, we'll fall back to using PMC_CTRL.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> [tomeu.vizoso@collabora.com: Rebased]
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

There's actually gpio-restart driver now, which I think is what you
want instead of this.  See drivers/power/reset/gpio-restart.c.
