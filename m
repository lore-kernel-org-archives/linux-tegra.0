From: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Subject: Re: No HDMI output on AC100
Date: Sat, 8 Jun 2013 16:21:59 +0200
Message-ID: <68C7110D-C493-4A1F-8011-5F9259C2F4E7@m3y3r.de>
References: <1370680435.24531.12.camel@localhost.localdomain> <4532876.1zmFKV0LLN@ax5200p>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4532876.1zmFKV0LLN@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


> On Saturday 08 June 2013 10:33:55 Thomas Meyer wrote:
>> Kernel version: 3.10.0-0.rc4.git0.1.fc20.armv7hl
>> 
>> This is the latest Fedora ARM kernel. Config is available here:
>> http://pkgs.fedoraproject.org/cgit/kernel.git/tree/config-armv7
>> 
>> This is what I see in the kernel log:
>> 
>> $ dmesg |grep hdmi
>> [   33.403417] tegra-hdmi 54280000.hdmi: failed to get VDD regulator
>> [   33.403441] platform 54280000.hdmi: Driver tegra-hdmi requests probe
>> 
>> any ideas?
> 
> is the regulator (tps6586x) build-in?

No, it's a module.

> The make everything a module path isn't 
> well tested I guess. 

Oh... So how to fix this?!

> 
> Marc
