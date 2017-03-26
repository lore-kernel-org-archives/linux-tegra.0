From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Only 1 CPU on Jetson TX1
Date: Sun, 26 Mar 2017 15:49:12 -0700
Message-ID: <20170326224912.GD4723@jirafa.cyrius.com>
References: <20170323001131.GA7507@jirafa.cyrius.com>
 <6da81dbc-b070-da0f-1589-ec2cb8f453d5@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6da81dbc-b070-da0f-1589-ec2cb8f453d5-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> [2017-03-25 10:32]:
> It appears you need to have
> 
>   fdt_copy_node_names=/cpus:/psci
>   fdt_copy_src_addr=0x83080000
> 
> in your U-Boot configuration. This is documented somewhere in the middle of
> http://elinux.org/Jetson/TX1_Upstream_Kernel.

I can confirm that this works with u-boot from L4T R24.2.1.

However, it doesn't work with mainling u-boot (grepping for fdt_copy_
doesn't show anything in the source code).

Does anyone know how to get all 4 CPUs working with mainline u-boot?
-- 
Martin Michlmayr
http://www.cyrius.com/
