From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] Input: tegra-kbc - add default chromeos map
Date: Tue, 27 Dec 2011 21:16:14 -0800
Message-ID: <CAOesGMjhL3z2grN1aK12O=sq0tdKhj-XrWixv4n-wGGVrJL7ow@mail.gmail.com>
References: <1325049024-7588-1-git-send-email-olof@lixom.net>
	<1325049024-7588-3-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325049024-7588-3-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 27, 2011 at 9:10 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
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
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Ack, hold off on this one -- it needs more initialization than what I did below.


-Olof
