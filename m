From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 3/4] ARM: tegra: nyan-big: Include compatible revisions
 for proper detection
Date: Tue, 20 Sep 2016 18:41:53 +0100
Message-ID: <a9485a88-55a5-9dd1-1a1b-a6c0a78ff476@nvidia.com>
References: <20160828173246.32621-1-contact@paulk.fr>
 <20160828173246.32621-3-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160828173246.32621-3-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 28/08/16 18:32, Paul Kocialkowski wrote:
> Depthcharge (the payload used with cros devices) will attempt to detect
> boards using their revision. This includes all the known revisions for
> the nyan-big board so that the dtb can be selected preferably.

May be I am missing something here, but for the mainline there is only
one dtb available and so why is this needed for the mainline?

I understand for the downstream kernels that the chromebooks ship with
they may include multiple dtbs, but for the mainline we only have one.

Cheers
Jon

-- 
nvpublic
