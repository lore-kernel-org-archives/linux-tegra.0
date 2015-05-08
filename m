From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v8 6/9] mailbox: Add NVIDIA Tegra XUSB mailbox binding
Date: Fri, 8 May 2015 14:03:36 -0700
Message-ID: <CANLzEkufD_k0M0E16EZ6=2UfjcY5SQ-Wtk=jneH4g0t830-8pg@mail.gmail.com>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
	<1430761002-9327-7-git-send-email-abrestic@chromium.org>
	<CANLzEksWtzSmz=OCuwVdY5RSG6gDrOoMyGsW3i9jMcjD3WtPKQ@mail.gmail.com>
	<CAL1qeaGfZtwNKxn=dT9DQ-c-j2X7Vi5jLtXx86zq2KscM8AFfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaGfZtwNKxn=dT9DQ-c-j2X7Vi5jLtXx86zq2KscM8AFfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jassi Brar <jassisinghbrar@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 8, 2015 at 1:53 PM, Andrew Bresticker <abrestic@chromium.org> wrote:
>
> The convention on Tegra is to use "nvidia,<chip>-<ip>" for each IP
> block.  Additionally, since the XUSB-related blocks on Tegra132 are
> identical to Tegra124, these devices on Tegra132 are 'compatible' with
> their Tegra124 variants.
>
> For some context, see Paul's comments in commit 193c9d23
> ("Documentation: DT bindings: add more Tegra chip compatible
> strings").

Ah, understood. Thanks for the clarification!

Reviewed-by: Benson Leung <bleung@chromium.org>



-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
