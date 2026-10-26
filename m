Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008550;
	b=0EoyRl0lLWSQHi+Hab1PQ7sxuvGi8cCwHwJW+kdG0jtGVZ+FgvCE5gbULvwvKfTuvsvS
	 QUTXbt1qTHpY9oBelovmA0mqIeBHSm5zrJjfHVL5JwZhMgRXsqvG1iaNea3teKAMiaq5j
	 JrC1zlsSH7PH+71OEi0//Q2iu0HXnDOk7qcZt10eJoQB6Jgz6mQEQP+t7ecJp1dvnQsny
	 1dxs93YtVKEjCuTqr+ZyQXt6W4BtrsHZjhuX/IbL6DFGTTxvUSnPDsBeti/Fmklcps6B3
	 bXnvyXNXI7LxdHLiKtRIMfD8XMPZccOphJS5o3lHgCUJ426j51FMTSL1gPcUKgkpSjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
	b=ZTs3KTcfOWm9dvKylUWEp8VOtQEDCSWwVMqxsO0ho1jxdP4Y7CmLSrTyZfqQNI7hhKoL
	 fMxlffQmx5SSCA7hbluNQVwKK4kH7BapRAybXvnWp/uGkD7ijxtCMWcnaPEBVCef3n0Cc
	 CVtcu5Y8Z8XGGV4sdMu/oiRI3rUQyUeuuhLrt0/ETn2K0BBIrP+1zg4BLG320KoFeq8p+
	 NQH0PGRLEnYkIIbYmZg8m/b9is3XTQ/8u5JAP+Eq73SyuYBolSnka2P3D9KIL0cXlWLJC
	 2xvR6nlD2i9aC5QK8j+i53y5UpnblQ5a9rtweURlv4VlxFf8/Q74gAczrNulYSWUo8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfYekKcy;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BBF606A31F
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 09:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7BBF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfYekKcy
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4789137c88.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008549; x=1793613349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
        b=JfYekKcyEXEhRe3UbjCP2v+C7MNjmDKf1Hd8xIZUCFapCV5iyNp0E5TPgM+8QNXqU5
         44LkajcDhwmnD6g1/JI6GRPZ4WaNxL9qsUpopxcKZscmnIvi9aOJg+RVUKzEiIYMgr5M
         bU6Y6VAwbpVOUIalzzrkhiZ3GlNju0apElrJDJdDJlnyCGFUhHvJOSJQWQVRJRzuHI2y
         FPcne9W7yxcNQPvjwyHNF9dzQqCMYPJ1vZNhSfO7AYv8BEwKEInEll1ZeUNIaZ65Gxa5
         Rq8PG3ynOgqyNAEG/2VAaGOI6/yEFMeRK6xRN4yz3UpzMIJ64YvvwhEEZ83BBtHwXt2N
         BZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008549; x=1793613349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWuIyGvj7TDVl2tZ8CiehJr07EFLO+I5wb0zx/hsUqc=;
        b=jOHjPruSx7F2/I/c6s5cuMlbQIvOWa+s5LQZq6fM6O5Ucndp5oHs0Y563C/27RFP53
         CLnGtLZkyOR3lDm/2NKlT4puG7Cd+lLY8yrDt2XdkWnA9/wfsIAupz9a6re5ITUDlA8Y
         NeCAnr38mEXoohVRRiMfquSz+Mq2IJkIH2YQN+vojVwf7i2J/QbTGD9TlfLp8QQU37jR
         ndKTIZl4incVPTX5DwdREq8HAccWrDpDi5jQ47QV7kDhGeGLemC9CqT4ZEwQp6GvtwoR
         AXZ/HAIyKZvv7YWDMxovV+tYfQO7eR+NzOh+NKCRO561y5T1Ezeh0d6GVi/Hk1sd5zeI
         Hidg==
X-Forwarded-Encrypted: i=1; AKwUvBw6fg40XieRSkt9P9IRhMjs3Dza4skfx+QmjlG10lXCWLSbRwhaZKqVEyy9YHxPVoC81DS9ti+nfrTyNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5b9ye+jX7QVW+zLWWv776aNUXEuJkLiqAyTi9AFFrXTQg+1Jb
	pHfmzhvuAleOQCFjVrH6aEf2PVrpLn1EoHMajMAZX/HCbPZ8lZMO7T44
X-Gm-Gg: AYBFou0gm++OduUnoPM/SeHf4bc3Ih2PtfMokT/HVjmbNFiiCKumM0YJXTRgn+LpiKg
	4aYXjOESOKMnB0Rkr5jDXvJ+Qj201/aBB3zWycYswawrCXhbxzfgJ0+jTmTG1ucX8p4WYYL0ypH
	GMB9mVupz9nqy9zYsHY80iefaFBOZlm8pQgKEYjQY/wzXEgNUx6hoOPbsPJw+RtGAEa1P0wUDWe
	95lmINLdNZ2BKI765MVGWOe5YjJQ1egY9IjWuji+A76dREKou5otDTvz6HHE/a2WtPkq18kxwbg
	Dvhyh/M+xH81N/YkqvoD+zn5koslbpXplWN85ktw4c8Grs/x1EiDeXUJtrISykXGmev/vIWok0N
	Vwyose6i6p2RJQCFf6n896vxQbE7wWqUHwQKw4j5y44ynH9LXvIlJrCPcr5vrIQ6JEnDgmsibO6
	D+QKy6yLIg7pXUoj4r2UdIhQzEWijkBrx/y1cer3HFhGHNMw4j/E6IydV4dWXCmU2UvUC40F4Ov
	PLtqs4rqAEwmlQT9cShbWcjAqj612SmZZvSsylnpTUIGPRwxrTKAAzhawK3QPl9xfuJ/7vkOodm
	DItz
X-Received: by 2002:a05:7023:88d:b0:192:fd91:c569 with SMTP id a92af1059eb24-19933e10ad1mr11647724c88.11.1793008548510;
        Mon, 26 Oct 2026 02:55:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm23720535c88.14.2026.10.26.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:55:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fix typos in comments
Date: Mon, 26 Oct 2026 15:25:43 +0530
Message-ID: <20261026095543.2729446-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <ar9qxmyIZEP2IlMp@orome>
References: <20260907062107.6859-1-hemanth.selam@gmail.com> <ar9qxmyIZEP2IlMp@orome>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026 at 10:40:50AM +0200, Thierry Reding wrote:
> For some reason I can't seem to get checkpatch.pl report these spelling
> mistakes, so maybe that's part of the reason why these are not flagged
> before they get merged?

That is exactly it, and there are three separate reasons it stays quiet.

The spelling check only looks at the commit log and at lines beginning
with '+':

	if (defined($misspellings) &&
	    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {

so on a normal patch it reads what you are adding and nothing else.  A
typo already in the file is never examined, even when it is sitting in
the context lines of the very same hunk.  Nothing that is already in the
tree can be found this way, which is why none of these were caught when
the code went in.

Scanning a whole file needs -f, but in file mode the finding is demoted
from WARN to CHK, and CHK only prints under --strict.  So:

	$ scripts/checkpatch.pl -f drivers/mtd/ubi/wl.c
	(says nothing about it)

	$ scripts/checkpatch.pl -f --strict drivers/mtd/ubi/wl.c
	CHECK: 'occured' may be misspelled - perhaps 'occurred'?

That is probably the run you were missing.

The third reason is the word list.  scripts/spelling.txt has to contain
the misspelling or it does not exist as far as checkpatch is concerned,
and it is much smaller than people expect.  "inclue" in
drivers/nfc/fdp/i2c.c:270 is a plain typo that no invocation of
checkpatch will report, because the word is not in the file.
--codespell swaps in codespell's dictionary, which is where most of
these actually come from.

> Maybe a better use of LLM tokens would be to have it write a script
> that can be merged and that will automatically run a spellcheck on the
> tree.

Agreed, and codespell is the right engine for it rather than
spelling.txt.  The awkward part is the false positives: codespell on the
kernel produces a lot of them, mostly identifiers, hex, and abbreviations
in comments, so something mergeable needs a tuned ignore list more than
it needs a wrapper.  I will see how far I get and send it separately
rather than hold up anything here.

Thanks for picking the patch up.

Hemanth
