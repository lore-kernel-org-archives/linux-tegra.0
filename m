From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: 3.8 config file for CARMA card
Date: Tue, 2 Apr 2013 14:36:18 +0300
Message-ID: <20130402113618.GE18519@tbergstrom-lnx.Nvidia.com>
References: <E61DA4A8-CD86-4F01-B8CF-D1D0D32F1C12@aotera.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E61DA4A8-CD86-4F01-B8CF-D1D0D32F1C12-cggpePV8Dd8dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Spencer Cheng <spencer-cggpePV8Dd8dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

(added linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org)

Hello,

> Hello Peter,
> 
> Apologies if you are the wrong person to ask. Since you submitted the patch for Tegra 3 support, I thought I try asking you since I can't seem to find any answers elsewhere.
> 
> I am looking for a working .config file for the CARMA dev board so I can bring the CARMA cards that I have (7) up to a more current kernel version. I've tried to start from /proc/config.gz which is a 3.1 config file but the resultant kernel compiled on the card won't boot on the CARMA cards. Thanks in advance for any help you can provide.

Unfortunately we don't have support for the carma dev board upstream yet. Also PCIe support is still missing from upstream, although I expect that to change in the near future. 

Regards,

Peter.
