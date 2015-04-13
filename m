From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH] configure.ac: Request at least libusb 1.0.9
Date: Mon, 13 Apr 2015 10:04:26 -0600
Message-ID: <552BE90A.3050207@wwwdotorg.org>
References: <1428512112-15430-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428512112-15430-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2015 10:55 AM, Tobias Klauser wrote:
> tegrarcm needs at least libusb 1.0.9 which introduces libusb_error_name.
> Otherwise the build fails with the following linker error:
>
> usb.o: In function `usb_read':
> .../tegrarcm/src/usb.c:260: undefined reference to `libusb_error_name'
> usb.o: In function `usb_write':
> .../tegrarcm/src/usb.c:233: undefined reference to `libusb_error_name'

I have applied this.
