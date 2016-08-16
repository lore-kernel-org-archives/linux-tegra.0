From: David Binderman <linuxdev.baldrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: main.c:588: poor error checking ?
Date: Tue, 16 Aug 2016 21:18:33 +0100
Message-ID: <CAMzoama0zUu7s-+KymL6jj2OceHb1uzN=ooSPLVsc9Vo2JGLEQ@mail.gmail.com>
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

but

    uint32_t bytes;

and the return type of read is int. Suggest code rework.

Regards

David Binderman
