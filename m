From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 0/9] Tegra USB cleanup series
Date: Mon, 15 Jul 2013 17:28:56 -0600
Message-ID: <51E485B8.5050502@wwwdotorg.org>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: balbi@ti.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org

On 07/15/2013 01:53 PM, Tuomas Tynkkynen wrote:
> Hi,
> 
> Here's a V2 of the few cleanup patches for the Tegra USB drivers, to be applied
> on top of Mikko's two patch sets. It mostly deals with removing all usage of
> platform data and using standard helpers and enums instead of Tegra-specific
> ones.

The series,
Reviewed-by: Stephen Warren <swarren@nvidia.com>
Tested-by: Stephen Warren <swarren@nvidia.com>

... although I think you'll have to wait until Mikko's two series are
applied, since this is based on them. I'll finalize the patch
dependencies for the Tegra DT changes in Mikko's series tomorrow.
