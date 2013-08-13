From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/2] Device tree changes for Tegra30 and Tegra114 USB
 Host support
Date: Tue, 13 Aug 2013 12:41:26 -0600
Message-ID: <520A7DD6.6050309@wwwdotorg.org>
References: <1375369218-11288-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375369218-11288-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 09:00 AM, Tuomas Tynkkynen wrote:
> Hi all,
> 
> Here's the device tree changes required for USB Host support on Tegra30 and
> Tegra114. This enables USB Host on the Cardhu's dock connector port and on the
> single built-in A-ports on Dalmore and Beaver.

I've applied this series to Tegra's for-3.12/dt branch, since Felipe has
applied the driver changes that back it up.
