From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Input: tegra-kbc - add default chromeos map
Date: Tue, 27 Dec 2011 22:50:13 -0800
Message-ID: <20111228065013.GB29273@core.coreip.homeip.net>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
 <1325053170-6984-3-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325053170-6984-3-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 27, 2011 at 10:19:30PM -0800, Olof Johansson wrote:
> This adds a simple way to specify the ChromeOS-specific keyboard map
> instead of the "standard" map that is used on other Tegra devices such
> as Harmony-with-keyboard and Seaboard.
> 
> I expect the number of different keyboard layouts to be quite limited,
> and not many should be added over time. So instead of encoding the layout
> in the device tree, with all the can of worms that entails w.r.t. agreeing
> on a suitable binding, just add a property to specify that this is the
> map to be used, and include it in the driver.
> 
> If, over time, the number of mappings increase, the binding can be
> updated to include a custom map as a new property, without having to
> worry about backwards compatibility on existing devices.
> 

I'd rather we did not make shortcuts and did the proper DT binding.
Samsung folks want the similar thing so making a generic DT keymap
parser and using it in the driver would be the best way.

Another option is to simply loading proper keymap by the early
userspace.

Thanks.

-- 
Dmitry
