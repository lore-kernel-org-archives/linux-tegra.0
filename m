From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: use signed bitfields for optional fields
Date: Mon, 16 Mar 2015 21:17:09 +0100
Message-ID: <fd76a3659b5096dfa6a5daeecf36ea7c@agner.ch>
References: <1426377952-12383-1-git-send-email-stefan@agner.ch>
 <55070C00.5040804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55070C00.5040804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2015-03-16 17:59, Stephen Warren wrote:
> On 03/14/2015 06:05 PM, Stefan Agner wrote:
>> Optional fields are set to -1 by various preprocessor macros. Make
>> sure the struct fields can actually store them.
> 
>> diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
> 
>> -	u32 mux_bit:6;
>> -	u32 pupd_bit:6;
>> -	u32 tri_bit:6;
> ...
>> +	s8 mux_bit:6;
>> +	s8 pupd_bit:6;
>> +	s8 tri_bit:6;
> 
> Could we make these s32s instead? According to the C standard, the
> type should be a signed or unsigned int, and s32 matches that better
> than s8 for existing Tegra 32-bit platforms. Equally, for bitfields
> that don't fit into the remaining space within a container (s8 above),
> implementations are allowed to either span bitfields across multiple
> containers, or pad the current container and start the bitfield in the
> next container. Using the larger s32 as the "container" yields less
> opportunity for potential padding and thus wasting space.

The reason I took the signed byte variant was that it gets filled into
that type later on. So I thought it would be kind of nice to see that
fact already in the definition of the struct...

But your argument has actual real significance. Will change that.

> Do you observe any increase in the sizes reported by
> "${CROSS_COMPILE}size pinctrl-tegra*.o" with this patch?

Baseline:
   5406	    180	      1	   5587	  
15d3	drivers/pinctrl/pinctrl-tegra-xusb.o
   5244	     64	      0	   5308	   14bc	drivers/pinctrl/pinctrl-tegra.o
  18072	   1032	      0	  19104	  
4aa0	drivers/pinctrl/pinctrl-tegra114.o
  19214	   1128	      0	  20342	  
4f76	drivers/pinctrl/pinctrl-tegra124.o
  18352	    876	      0	  19228	  
4b1c	drivers/pinctrl/pinctrl-tegra20.o
  24621	   1068	      0	  25689	  
6459	drivers/pinctrl/pinctrl-tegra30.o


With the patch above...
   text	   data	    bss	    dec	    hex	filename
   5406	    180	      1	   5587	  
15d3	drivers/pinctrl/pinctrl-tegra-xusb.o
   5252	     64	      0	   5316	   14c4	drivers/pinctrl/pinctrl-tegra.o
  18932	   1032	      0	  19964	  
4dfc	drivers/pinctrl/pinctrl-tegra114.o
  20142	   1128	      0	  21270	  
5316	drivers/pinctrl/pinctrl-tegra124.o
  18988	    876	      0	  19864	  
4d98	drivers/pinctrl/pinctrl-tegra20.o
  25781	   1068	      0	  26849	  
68e1	drivers/pinctrl/pinctrl-tegra30.o

--
Stefan
