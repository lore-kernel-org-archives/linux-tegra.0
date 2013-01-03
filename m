From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCH 4/4] ARM: tegra: Set SCU base address dynamically from DT
Date: Thu, 3 Jan 2013 07:38:48 +0100
Message-ID: <20130103.083848.1533296860718294309.hdoyu@nvidia.com>
References: <1355725087-11363-1-git-send-email-hdoyu@nvidia.com><1355725087-11363-4-git-send-email-hdoyu@nvidia.com><50E4845D.6020809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <50E4845D.6020809@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren@wwwdotorg.org> wrote @ Wed, 2 Jan 2013 20:02:53 +0100:

> On 12/16/2012 11:18 PM, Hiroshi Doyu wrote:
> > Set Snoop Control Unit(SCU) register base address dynamically from DT.
> 
> Hiroshi, what's the status on this patch series? I think Rob had
> comments/objections on patch 4; are you going to post an updated series,
> or is this series replaced by patch 3 in your Tegra114 series?

As Rob suggested, at least, SCU base address should be detected in
common code, scu_of_init() even if DT /cpus is the primary way to
detect # of cores. I'll repost later.

This patch can be done independent of Tegra114 series.
