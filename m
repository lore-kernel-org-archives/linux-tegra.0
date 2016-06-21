From: David Binderman <linuxdev.baldrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: main.c:588: poor error checking ?
Date: Tue, 21 Jun 2016 08:57:25 +0100
Message-ID: <CAMzoambgi77aRW+XTmk-g1qdsMw1Spu3vNwyxYcfTFgpg5=VaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dcb314-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello there,

main.c:588]: (style) Checking if unsigned variable 'bytes' is less than zero.

Source code is

        bytes = read(fd, buf, size);
        if (bytes < 0) {
            ret = errno;
            goto fail;
        }

but

    uint32_t bytes;

so the error handling code will never be executed.

Regards

David BInderman
