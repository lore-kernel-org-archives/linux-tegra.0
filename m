From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 0/9] Tegra USB cleanup series
Date: Mon, 01 Jul 2013 16:03:41 -0600
Message-ID: <51D1FCBD.6070104@wwwdotorg.org>
References: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372455427-20898-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: balbi@ti.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 03:36 PM, Tuomas Tynkkynen wrote:
> Hi,
> 
> Here's a few cleanup patches for the Tegra USB drivers, to be applied on top
> of Mikko's two patch sets. It mostly deals with removing all usage of platform
> data and using standard helpers and enums instead of Tegra-specific ones.

With the issues in patches 5/9 and 9/9 fixed as I mentioned, this series,

Tested-by: Stephen Warren <swarren@nvidia.com>
