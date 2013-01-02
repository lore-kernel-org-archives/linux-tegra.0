From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 4/4] ARM: tegra: Set SCU base address dynamically from
 DT
Date: Wed, 02 Jan 2013 12:02:53 -0700
Message-ID: <50E4845D.6020809@wwwdotorg.org>
References: <1355725087-11363-1-git-send-email-hdoyu@nvidia.com> <1355725087-11363-4-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1355725087-11363-4-git-send-email-hdoyu@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 12/16/2012 11:18 PM, Hiroshi Doyu wrote:
> Set Snoop Control Unit(SCU) register base address dynamically from DT.

Hiroshi, what's the status on this patch series? I think Rob had
comments/objections on patch 4; are you going to post an updated series,
or is this series replaced by patch 3 in your Tegra114 series?
