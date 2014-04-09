From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] usb: rename 'phy' field of 'struct usb_hcd' to 'transceiver'
Date: Wed, 09 Apr 2014 20:27:39 +0400
Message-ID: <534574FB.7060901@cogentembedded.com>
References: <201404091757.16574.sergei.shtylyov@cogentembedded.com> <534567BA.5030208@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <534567BA.5030208@wwwdotorg.org>
Sender: linux-omap-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: Peter.Chen@freescale.com, stern@rowland.harvard.edu, thierry.reding@gmail.com, balbi@ti.com, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-sh@vger.kernel.org, magnus.damm@gmail.com
List-Id: linux-tegra@vger.kernel.org

Hello.

On 04/09/2014 07:31 PM, Stephen Warren wrote:

>> Return to the 'phy' field of 'struct usb_hcd' its historic name 'transceiver'.
>> This is in preparation to adding the generic PHY support.

> Surely if the correct term is transceiver, we should be adding generic
> transceiver support not generic PHY support? To be honest, this rename
> feels like churn, especially since the APIs and DT bindings all still
> include the work phy so now everything will be inconsistent.

    How about 'usb_phy'?

WBR, Sergei

