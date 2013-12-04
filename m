From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
Date: Tue, 03 Dec 2013 20:59:02 -0700
Message-ID: <529EA886.8010508@wwwdotorg.org>
References: <1386122564-4246-1-git-send-email-chris.ruehl@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386122564-4246-1-git-send-email-chris.ruehl@gtsys.com.hk>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Ruehl <chris.ruehl@gtsys.com.hk>, balbi@ti.com
Cc: gregkh@linuxfoundation.org, thierry.reding@gmail.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 12/03/2013 07:02 PM, Chris Ruehl wrote:
> usb: phy-tegra-usb.c: wrong pointer check for remap UTMI
> 
> A wrong pointer was used to test the result of devm_ioremap()
> 
> Signed-off-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> Acked-by: Venu Byravarasu <vbyravarasu@nvidia.com>

Out of curiosity, when did that ack happen? I didn't see it. But anyway,

Acked-by: Stephen Warren <swarren@nvidia.com>
