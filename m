From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 01/10] ARM: tegra: Overhaul Venice2 regulators
Date: Fri, 28 Feb 2014 10:42:44 -0700
Message-ID: <5310CA94.4030703@wwwdotorg.org>
References: <1393605629-30514-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393605629-30514-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/28/2014 09:40 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Some of the regulators and the relationships to other regulators are
> wrong. This commit attempts to rectify this by making them more similar
> to what the schematics contain. This starts by adding a +VDD_MUX supply
> that represents the 12V input and derives the main +3.3V_SYS and +5V_SYS
> supplies from that. The majority of the other regulators derive from one
> of those three.
> 
> While at it, rename the regulators to match the names in the schematics
> to make them easier to match up.

I've applied patches 1-9 to Tegra's for-3.15/dt branch, and squashed
patch 10 into Tegra's for-3.15/defconfig branch.
