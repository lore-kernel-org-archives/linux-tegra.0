From: Jon Hunter <jonathanh@nvidia.com>
Subject: stable request: 5.4.y: SUNRPC: Avoid RPC delays when exiting suspend
Date: Mon, 9 Dec 2019 08:46:24 +0000
Message-ID: <370ef599-8164-170c-8ba0-f8a9082578c4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: Trond Myklebust <trondmy@hammerspace.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Greg,

Please can you include the following for 5.4.y. This fixes long delays
exiting suspend when using NFS and was causing one of our suspend tests
to fail.

commit 66eb3add452aa1be65ad536da99fac4b8f620b74
Author: Trond Myklebust <trond.myklebust@hammerspace.com>
Date:   Tue Nov 5 09:10:54 2019 -0500

    SUNRPC: Avoid RPC delays when exiting suspend


Thanks
Jon

-- 
nvpublic
