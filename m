From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Fri, 17 Jun 2016 10:34:45 -0700
Message-ID: <20160617173445.GB28814@jirafa.cyrius.com>
References: <20160612034541.GA31426@jirafa.cyrius.com>
 <20160616161611.GC19360@ulmo.ba.sec>
 <5764258F.3060207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5764258F.3060207-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <srwarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> [2016-06-17 10:30]:
> If simply using mainline U-Boot works and is an option for you, I'd
> suggest that.

Sure, that works for me.

Some background: I'm currently in the process of documenting how to
run Debian on the TK1.  I wanted to give users a choice to stay with
the u-boot from R21.4 or to upgrade to a newer mainline u-boot.  And
then I ran into the problems with the R21.4 u-boot I described.

I'm perfectly fine with telling users they have to upgrade to mainline
u-boot.  We provide precompiled u-boot binaries for TK1 in Debian
anyway.

-- 
Martin Michlmayr
http://www.cyrius.com/
