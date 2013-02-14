From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [v2 1/4] ARM: tegra20: create a DT header defining CLK IDs
Date: Thu, 14 Feb 2013 21:34:22 +0100
Message-ID: <20130214.223422.1106350409475384652.hdoyu@nvidia.com>
References: <1360868369-20093-1-git-send-email-hdoyu@nvidia.com><1360868369-20093-2-git-send-email-hdoyu@nvidia.com><511D45E0.1080105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <511D45E0.1080105@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "sjg@chromium.org" <sjg@chromium.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren@wwwdotorg.org> wrote @ Thu, 14 Feb 2013 21:15:28 +0100:

> Oh, and I don't think you updated e.g. nvidia,tegra20-car.txt to remove
> the list of clocks.

Not yet removed. I think that this could be done with the patch which
allows kernel source to include DT header files.

> BTW, I assume this patch includes the changes from my recent "clk:
> tegra: fix driver to match DT binding" and anything else similar that's
> in the most recent Tegra for-next?

Of course not, that's a little bit too recent.

I'll rerun my script against the laste Tegra for-next and post them as
v3(inc. Tegra114)
