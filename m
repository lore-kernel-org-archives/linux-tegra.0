From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1 0/9] Support UDC on Tegra 20/30/114/124
Date: Wed, 5 Jul 2017 14:31:47 -0600
Message-ID: <b5c54655-ccf4-2d4e-59fe-4a9e4609605a@wwwdotorg.org>
References: <cover.1499273075.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2017 11:19 AM, Dmitry Osipenko wrote:
> Some time ago Thierry Reding sent out patches that enabled UDC on NVIDIA
> Tegra, unfortunately they haven't got enough traction to get into the
> kernel. I've rebased those patches and added a fix for the Ethernet USB
> Gadget on Tegra20, Marc Dietrich tested UDC driver on AC100 and Nicolas
> Chauvet on TK1. Like an original patchset, this series adds support for
> the peripheral mode only.

Does this mean that the relevant ports no longer support host mode? 
That's going to be a user-visible regression, which doesn't sound like a 
good idea. Isn't OTG possible instead?
