From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/6] USB tree changes for Tegra30 and Tegra114 USB Host
 support
Date: Wed, 31 Jul 2013 17:22:52 -0600
Message-ID: <51F99C4C.6050508@wwwdotorg.org>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: balbi@ti.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 11:41 AM, Tuomas Tynkkynen wrote:
> Hi all,
> 
> Here are the patches for the USB tree to enable USB Host support on Tegra30 and
> Tegra114. These are based on my and Mikko's cleanup patches that just got
> merged to Felipe's tree.

This series works fine for me on Dalmore. However, on Beaver, I see the
following:

[    2.428480] platform 7d008000.usb: Driver tegra-ehci requests probe
deferral

... which never seems to be resolved. You can take a look at my
linux-next_common branch to repro this. Does Beaver work for you?
