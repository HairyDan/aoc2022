import string

input = "rGnRRccfcCRFDPqNWdwWJWRBdB\njZzVVSZSjmQvZTSZfjmLzNPJqWtJBwqpNtBpdWdNvd\nfZfjlMLVshMFhcHnDG\nvJRmRfJbfRfJsCpvgLggNVsv\nzlzSrMPZMgBFFMNMVWsjsF\ndzBSBlzdcggRGdndnn\nhNwqVDVDdmQwQPrbDMSSMRSWSM\nLvnzJJtlcHstlffCVpMSbRMpBMbCgVWM\nlGvvscLHcfsHtvlsnZmmNGhNFVQqqTdqFd\nsHGzGsfcZnHfhbLRFrdrhRFf\nvwVqzSSjSSttjSqgNMqwzSSVCCgRPhPhFLdCRLLrdCRRrDLb\nvvwwtvvVwSvMQzjvmNtJsHBnsZllmnnTBBcBlTnW\npzNVBVplhfLfVfVStZrZHbQHZQTb\nsdPPJdCjbdQHMTWt\nngmJGFjJwJCmGcnJcFtgwcDBNLlqfBpvfBpqllhlfL\nTGpphMZhJQpGLZTMCCtsBMCSDsStBFcB\njdfgHClHrdrbWvWgjqmctSDqltDsFFDFBc\ndNWWvfgCLzzNNLZz\nvvHzBrTSvHFbqZqZTBBtzdVfGCGhJSfGJGDSdGMhVG\nlgmgslssslscsnRlVGWGWGVMRCll\npQPsjwnNgQmnNNwQgNLNnmgZqvFqtwqtrMMzvzwFtrqTrr\nTNhNLTrswwsnFNrrGZVnJnZmVpSjjVDnPp\ndBlzzCBqgfWMBpPSJDHVZSVP\ncqzfpcdcNFFGrhcb\nLLpzCzSzJnLQVnTNhQ\nvtDqwBcRztQbthtV\nqZZZqZvvsZwwjvjDjspFlPpSSCslpzPlls\nrsZVlmStlFZllvmSSvLRqcGMswMMzjMsjqGCjzMG\nVTPgQBQdBCwgjCnJGC\npBNTNHdbdWLrDVLbDmLZ\nCFmsmwnCRmjCjnCzJZQhhBGQBsMzbP\nWvltTWVDdNttdlDbbZzJvPJvBBhhzM\ngHDfTNlDDdgVNdglgfqtpcSFwccCmmwnRSwzzHHF\nhgmhWgCdzpjPCzFC\nNVfgffZblZQVNtFZPntPDrJjPt\nTwbQLLfMgdhswWGH\nJStSPHPJNrBCtBZMPtHTVfVwLcbbLTcSgfbVfn\nGdhhCplmdWbVddLV\nqpFvhQppFRlqmFGppRhqvvFzZtQMHZMzBNBCCzNDHHMPzB\nMvCMQmJCMDQjwMJCSJpQmDcnGBggfsgljGNslsNGjTHTNf\nHRPtRRzVWWFhrFdZhTGlTTLLggBLVgGGLf\nzZhdWZPWRdqttWWRPzRPmcpmpQqvvSCvwHwQmJqD\nNwrVVWrvwtQDRdRqWbqh\njCCZjlJZZGclGPpCJlcCBhJshgqTsQgbDdshTbgLRh\nppppflPZlpvfffFzHqFV\nVmTwGVwnwHnSnqGSVmBBwwmTZvzbCrsNWcsZsqFzCWsbWrNv\nJMPPgRDPDgghJggtzsMbZvsNCrWcNsbM\nDhgJllPPJcgJpptDDDPldpmTwjHBmSjBBwmBwHBdBmTQ\nvblvFHvrQTjqqhCpFwLnFL\nRDJRWsdRdgdWZMCMQSVppMJpVL\nDzsgRNNsftWdQmcvbPcfcBfj\nwTgbsTmgqSbzSlSvFb\nrNdDdZnRtJFlmVSHZz\nmfNjjmmdNWhWCsffwC\nLltBNFLHHcJcfNdNTwbbNsfW\nvQSMCzQSGdSdvjsTwmwfwWwV\nnRCSzMCQDqlgdlRJHJ\nvgqTGwnhpLFsVvrR\nZZzTHlTlJNbcLfRtppFzfs\nPlWBWbjQjJgCDCMPTTGT\nwtBdWdDpjDdwScBtnsFsPmmnPbPHHPghhh\nfSSVGVzlTlqGfffLTQMGHsmFsbmPFbsPbhQZFhhs\nTzLzfqJTVRGvRMvqvLGzMqRfSvcDpNjcjdcwSDBDtBDvSCDj\nFrdCCzmqFrpDRTRHRLnQJJnr\nSGfNRWlBZlgtRltGbvnTVbJnSHvLHVbH\nNRWsfWBwwqwDMDpc\nvSfsmsdssdjSdZdSgRnmLRGNzgGnqwwB\nVrlThFPTPjHFDPRqGGnRnNLqqqHG\nlPtTDVCCDrjppfdSQbcJMsbftv\nRFFslstRRfSljtsRJPjRtRtngSHbmbbhGbHQQmgbmgGhGQ\nDqBZdWZvTdMBBTLDzqBhFnvgVhnHHFbnQVnGnb\nwcwMMMTzZwsjtCtjFN\nCsscSlwwZDscMNhhpZhRZHRM\nVjQvjbQvbhJVbvTbnQTnHHLrRFRqqFqFVdMHNHNH\nQbTjjbtJnvttntjgjJjPDwwsBsSsSlslhlwwPCBS\nRLjhhBBcNNBNhNjhpwScwSCTFwcFvMwvlc\ndJqPJqbqtmgmgdPrdgwvDTCSSlMSFDlFTzFg\nstCCqmbGrrbmPsqZhHhpjjNhfjBnnsnp\nLfDzcMMVsDLLzNscGhFFcQhlhhBRll\nZCbSbwdmwPnPnPmHjdjWFWsWhdGjdH\nbZnPbvnvqCvJDrLJNssf\nbbldQHVltHQSSJJmTlwJGjCjCChchgMhHhprCpMv\nWNPDFfqfzFsBFFnmgjGhgccjpcpgMGrs\nmZFFzDnmzBBZltdlZSVtZS\nhdJZZdJTvnJmRphvvpGnwvqzVFSwVlHVlFHFHNlzlgFgHF\nQWWWBbrCCrtjQsMdcWMBfttHsgFHVHgFSNzDzFlVLggHzz\njQdBPCtrtcPcMQCTnqnhTvPGGvnJGR\nZhsmsbNVmFssmblMMpdvvQdwLQRppRvQ\nGjnNNGNCGjfJcqrQDvQQpvQLPpnQQw\nBJjWqWSCrNHrqjfhlHzlVbVtFmtHTV\nmtJmPmQBbPFshnJzZpLZ\ngMqMHRGrCHSvrRGrqPZLnplFzlVhFspL\nRrDrgMGRDPNtfmDN\nwqqvqVmlpqchqrDD\ngzRltSjgFlWshrdngrpPcDcd\nRRjtsbGfGLbsLWSLtjzGSHNNHmHBwNNHNmNfllwVfl\nmqFBQgnMQQbJqnTswSMNWGsDswZZ\nHgzlRzHccfHsfTwSWfNSNf\nVLldvpHLVHrFJFJgpnQbJn\nSzCJtLdDCCtqCcdDfZMVMfGVbsVZPPzz\nwpwWQWjQgwQgjNBwgHQgsGfPfbPsZPGSPjZmrPrV\nQFwpTwpHlnHFNFWQWlQgNwNLCddvDShtLJnSJCLqJJttDt\nHMgCVHggtqMMvjgNjNCMMwfWfPwWPJQQNzWwJzlQlQ\nbGFrqrFGZLLdFmSPcmPzQJlQcWzJmJ\nhRphhShnLGFdGSFSLRGrdqdqsjTtsBTVTTBnVjVvHHBtHggt\nhHhnFHQpcFcHjcjfZfZRnjjnNNBvNNNtwvNtbwPtNcPtBgbg\nzzVLWCHLSdCttbvw\nmMLsHDMVFlRhhmhm\nMHMgBNQQPCMMQBbBQQgJHbWttdlfWpZJVWtGGztfWJZW\nnvLzDTDFDFqSqncTFddLGfWfssVWWVdlGs\nnjScSmcnFDDhnmcmnSBzMggjjMQrQCjBQrwH\nMFVFHqhHHfVVSGcVQCLttttWTtLQ\nBgdJJrJzbGpLssCtTLLCpC\nPGBGdjjllBGBjhmhHRlmSfhRDF\nBLJmWwBJDDmLDFnVPzvTttvNhNFsHhvvQH\ncjbSqfWbRrbSzNMjhtNzzTsT\ndRdbgflfqmWggGmwWW\nlBTTnDMnNwWdpwMllTMDdTBTSRJjRRcSJRhRGhwtccScgjtg\nvvsnCVnHHnsvPzLfVJjtShgGJGVJSc\nzQQvzCZbsnbHCWMdFpMqblBqND\nCLggQjStSQjLgVRfhBRztwpBpt\nDNVmJDFcGNGlmNDnGFnsGcDdwzzZwZPsBPZZhhfBTpwhPfZh\nDMDccrnrdnDJcJGFGmCqbLvQqHVSSQVMCgHV\nrZVNNDrCFCbjbRSgjhZv\nczcMTcGMlcjjvvvGdhbb\npHMpHtLWHHHztMzsvqvnVqNvsnNDqW\nhPhPBQVjzjQScjChRVVVsdfbvdmvvpGmvfdbff\nnwZwZWNTrwLTTDtbfmHDpGccstDv\nFLFJNllFrwTgTwNLnwTlFPhcjjhRhSMSjjBPhzJPQq\nCgJCHgJfHzGrrMjJpl\nSWqQLSQqdFSLrrCSZrvpzjMM\nQLWqhFLQdwFqnPbHcCHPbhCh\njLplfcfjQfptPtLTTtPrRqCCCjZvhBhwhDjwhBBBqC\nmsznRWgSmmHbSJwDvvBqCCqWFF\nmzdsVnbbSSznmbGgGSmTclPcrQffdLfMTLRLtl\nPpQQFdNFBtdsFNNPPthTtldwGMnZVvmbbVGbMwrGvG\nwHWRJDjHHRgJDZlmVZmnvDbDDM\nJqJfgRWLSqWJfcsBfwPpPwFpNwfC\nSjpVgjghVZvssgsHjQfHcfcnfNcnbqcRbr\nWBtNWTWNJnCTCbRbQR\nFlWGtwPJmJPBmwFtMGmpNhDSSSgZhSszzghsMD\nfSfzvQSbbSSSTQQzDQTzHsqHmjHVFsjqVJsbrrLs\nGWZncGGdBwlPGPJcGlBcPgNGqLqmjsHMVLrrVMwjsMMssLmr\nltGWNggZJnCRhDtzvtTt\nzzSHMgsPWzLSJQMMWQWLJBLVqcmVrzmvcpFcqmqpmFprFV\nTlDnwhDblbnbbtbjdpVCrmFVDgmprcRCcF\nhTdjgdldgdfZWWGGHQJHWZQH\nTZVsSRGsGMGWZTvpmrgcMCmrwwFFgF\nBDPPnDDLDqDFLNLgctLNrm\nPzDPfHPdDPdJPfdHJqdbnnSVvRvsjZSvbsrRGhvGRhTG\nnnghnhLhgdVqSPLHcPHPNtpmrRptNt\nDwvMWlsJlGzsGMlvsZcWWbRrNHNtZtHttHNTNttTrTTR\nDDzDcwlWWGlcsszGwBCggFqgghCBfqCFdhSh\nGzgQpJnwgJfbSWpSvqtvlBtmSLmLlvLS\nzCHsRZjHdzVPRFNlLlvtlNMNNrtDrt\nzzZVsCcCCHzRhcbpwGJGGpcf\nlVQMrwlMwwMCBZmFtthmVmsgWhTL\nbdzHSSFJcvzcpFDptsDDmhTgLmnmmmhT\nSFpcGvdpddvGlBPZMCGrBZ\nQmQTQTFTSQPNbsPjPnntZjjnnDlBBB\nJHqJqhfCJpWfpHchRzzCnGBjtjDZltsZpljGntrr\nchdMHqHcMhWMfRczMJmmQsVTSNbNNFbdQNST\nHHdFqqDRdNsHfNRsjWPCBcCCZPwDCZVBVc\nlhlgprMrlprbplzwZQPwwPjbZZCPwP\nlpljllTGGGglhThpjSvdssSnfRRTdRnvsN\nsDzjCqLLzddjsdRsSShgmtnCgFnmnffmmFcf\nrJbqJMTqJGVTrgnFmfhcfmnJgm\nGQbBWZGbVrqpqWpZZHlwDsDsRsdDlDRDBDsD\nLbLbvbhQgblwwqbjGG\ncFTTMsczJsTWJFfNNlVqvDqjNvlFqZ\nmfMvJHvmdLgLRgpHRR\ncvhRpWWhpfpcTpWvRcRcWVNwsjNLJFsJjwLtMLdsdsLJjL\nZZPqGqgZrllbbVMtnJtllwJtltnj\nrrPCSQHbbrSqHqqZGGQbvzBVTpfzmvBvcvRCTpzT\nVMzNNhWVlrbJHbjcJCjCSR\nqgtDBgBtTGjqJvSPRJHCqHcd\nGfnfLjjgGLmgBWpWrMMnzWZppl\nzRtfBftCvvPSvPclZgcgJznWcgnq\ndDpGpVdwdGphbDMpdQhnJjjqnZQWnZNcNWlqlJ\nwdFdTDpGDSCmTtRqRq\nbTGrRzjbmbmqsGDDjHPpWpfjHJZFVPJp\nLwdwNNgMLfZTdCHPPd\nlhtwtvttgnchcsrvmzTvmsTbbm\ndfLjdlqLtqpbpPQpHS\nZGJnFZFDpBWWGBTzzrhmhHzHQPFPvQ\nNgJGGGNGnJWgMDWGgDpWnZWgwdRCtwCCRVLdjwVcccdwct\nMMtzRCTnVVnHbbMNrHMRRVQJFrPPDsrsJgjjQGJGpFFF\nZcqWqdfcmfhwDgGpDJmmQDQs\nLhwBddvlddvdLCgCtCTzgzMN\nZffpWcfPcPrTwlVCvDhhcS\nGMLBNHjMBGtmjtMQMJjLHTwwsSswdslhGwDhsDvCvV\ntQgNRHMHQggHjQttbZqfFqrnqSZWfPZR\nMDqbPdqGfwGbfMswqfJdPGgQpCZvQgmvJFCmQJQvRCQv\nWFthczzzrpWgpHlRRC\nBhLSFnFrcLzhtSFnSTznhGbMGwjGwjjPbGDqjdqTMd\nzbQdJbBPTsWcCgdmfC\nDNqZHjvwZMShDhwqvLmlgVnLmcnsfnVf\nHHSFSjNZFqjZrhQpPtzrBgQzPrpB\nBzzJHvJJvWsgzPPTWPSJsJgNtmMtNFlvNZFltFtttjmtVZ\ncbccGnqhwhdpqRnnrdqdntZVFfMCltMtGFCmtFNFlj\nwnlRRQbnpHQWHgSQTs\nSQQBFnPzSnQVSzFSWlzlBSWFMsqmMmzLLChTmmMqzsTChmss\nZgdwrJdtJrgpcCwZNbbjsGhGDvMrrqmmMmDhTsqv\nNtRZwCbZbbjRZNJcRbjWVWPnWHQWVPBQnHlfRB\njLtlpljLpsbRnDNtBpbjdqWcqChccbhqChqbWQbQ\ngVwwggvJJwBqgWqfBCgT\nVHZrPSHwzSwvDLnnLlsrDRBp\nGBDGDrhwVrFhVCVBvhhvwBDVcmlfcPcMMmmmqNTScNNNflSF\nRzRLRbddjZTbTQjJSWNzlNWNcPqNWqSf\ndHjRgddHnZngjHLnQsgZHbGrrVpwpTtThnDBppVCTpDp\ndpjwvdLwtvJszhmzhRVj\nQfFQrffPBCBZMQrMRWzmzmVWVghVLs\nGBPGBrFrHZTBSTqvvLNtqSpq\nzFcGnQcZPZncbbbhPncpNCwzvwmjMvwwmwmpvd\ntBRtdrRTJNvRjMMwRC\nrlWSqVtTHqtVTrngQnfbQFdcghgW\nRMjfvsbQPvvNpLmLprFJFrFJJT\nSqCtGCcZZCwcCqqcGdWGdSZmMTmnVBdLnTTgTrMgrgVLTB\nlGzGzHSCzHctsQRMsQPzDjNs\nFQTWdTVMDWWVWFDTFcVcWJqTlCCCSlFmtCmNZStsmFmCwCgm\nnPLbGZzrgwBlbBlS\nPppGRnzPnpzvZVDJVvTfDVVVdD\nCQlDsWWfflWDMMhRmTGqFwSjJFdqwSQJzF\nPgpVbZPcHgBcgZrBZcHNTTbdqTGjSqFjRFjwSjGG\nVvgRBBNLRrPhsfhLWLWDtW\nhHhZDcDcPZWpLZWpCQ\npbqdwmbqqmBpdMsgdqjCGvfCWGTWLGmWfGQtVt\nwjjbsFBRbwFgMpDznPDrrFcShr\nzGmsJQsDBBmDDJJpRZzSqZZPRffWRSqh\nLQlVHjCCNCLRSgWlZnhPZW\nbLtHCHtjVHQDTJcGDQbs\nQPRlnHfPllgRfnqhcwgwGMGzBWzBBBBB\nLCtVCZtDbdttjZFtvjvdDMGGBmBWWZWBBWGSsWJSJm\ndFVNTVbTjMnHlThHnpHR\nhGhZLlqmqZWTcWrmWqrWmTrqjQVQwNHPgPwPPSgPjNwVSLjD\nbsMJBRMvRsvsJMRRbspFgQwSNNSNwVNjgwDMDgHH\npFnFtvCQFsbBQzsBrmnTWchWZqWqWqGZ\nwpwlJdCWJWdzlWGRRcrDrwRqrqDFrF\nZmPsSVnnTvmHDgFcDTHFTF\nsmVvnSQhbsNsvsmsnQQclzGCWpphppLJCdJWBpll\nFfSmMJmBDfBjDSjFtBVmftBQPwPhPCbhQvbhwCCbvhhjhq\nZnZHZgclJWNbwbcbcwPrQv\nZNNGLHzHNZTTJnlFFfVmDBsFSVLdSD\nDDBvjMvBJMtWjNRNrvdtbshTdpssdPSgpFpP\nLwGQcwLGJTSssQbg\nwcfcCcmHfJmcLLVZVqBBBqWDRqBRDWzHNN\nLhnpcdcdrChplvllHptlgR\nTsSTSBqPBTGNzqGfzfffGfVtPlHHvMDtHtRMlvjHHgtv\nsBfWNGQmQbCgQhQn\npnnHngqsRjstjRgtrBDlBwDgwDZBldlD\nSFvJMGhhvcbMSWPJbFzVDdzDZwDFlFlzfFBV\nJJNWGSWSMNMCPhcvMhGStwtjtRRtRRqRsCtQjqRj\nnQZfJswFffjJplqhlqZlVVhp\nvtdCvGdBCzVHgnzLDlpL\nBbCTGvtGnBBCPjrsccjrwbrFjj\nwjjvDQwWvSQDLbwfNrrJcMHrczcpWN\ntTnqlRsTRthFhnnpfNrmcTNMzfCzHr\nslsBGVlqghMRhsRlltsFDgQSDbQwPSPLQSZjPSLQ\nPcQmmQRQZRFQPjjDWhgCgWdM\nnBGtbGNBBGvJbbtpWhCNCjmMjHlWHDdM\nvbBnBBrrvVBtJJbvtzzptRQLLZLRFfqLSTSfzqwfqm\nPBFZDFPsDZBnTTBdDHSNSpNzmVTVmVGlNH\nWvqFLWQCMQLMRtQJFWQLvQCJVzmNjNzVCllVmGSlNHlVzljH\nWRtrhtWQWFbrrBwBZrbn\nMwWnMPnMPNswjPDvRbsblCGFZGZF\nJdJVVVtLdgZhvGVBDZhZ\nrqmdqtgcLQLTfWffwGGmmp\nQQhhWzQWsMhZjbbmffgfjrGDdfdGvv\nHnCJVHcnnHttCRVRCcnBCqJBGfPmTvTvdDfvqfrddNDDggGG\nwBwwcRBBCJpFcFcpnVVFQWQLSLbQZLmhzshMlMwQ\nCgDNbsDcHjTcgDCgjRHMJrlHFrBHFmrttrGGtFwG\nVfQJnvJdhvSJZphSzWpvSzZSltGGBllGBqPPFPrwrmfqtFFB\nVJLvdQhphhQnjLsjDDjDcRbL\nLjljTPdLdccLhcMZhTTMdzrrtzGgtvrgnttNDGrWtDgn\nhbCmCHqHmSbRgNrtvCgGgttN\nSJFJRFpHqwSFSpsHwbHwRhSJPTjMMMPdPlPLcVQscLVQQVlL\nQmTTQVqrVrMvbCwLczbRlQ\nsSNtNGZFjBSsjSSShcRvwCFLlzWcWRzCWv\nLLNjZhSGZBnjhJjjrrTgPqgPgTfqfJpf\nDCCjDDtHVptCtvMZlJbSnScWWfHlhW\nqsTFmTgmqRRLswQGmfWwSnZSSfJSSWZcWb\ndsmqgqdsNgTFLFRLGmRpBtBDtDNVpPCCfVrtpD\nLLNRhHhRbsNGjqCBPBrLCw\nlgcFfvWGTllzfJVVFVWDzFqqMrZCMBrZZqvSrCPZSSrr\nfFGGlTTTlzWQGzzDFttQmHnpnhtmmpRssm\nLZNnBgtlNZztzmGHmpHHPPPm\nQwjjQRCQScbFFFchhFrFjwmsNPHSSWJGsGppMSWMmWqs\ndQCwwbwhrjQQjCwRwbhRBlDDfBtVlnNnlgLdnvvd\nwRbGbqqGCwnGTRqBqlMVphpgMgMFdnFVnt\ncgzvssscgHJVdhDdhDMvDM\nPjcZcsJrJHWgrPBQmCqRBPSSRCSb\nrHBmLlPLlTzztvRtGsVL\nNWJJWWjJDJWWhphqwCFCwzvRVcgRtctRgNNVVscsGc\nhqCCsnCpCDnbCnWhwpbHbBHmMBMMmdPrZfdP\nGRPprPQdsprGpGgGTlqfVqnZLgnLnwNZLw\nCCWJMMvhhCvthtCjvDWFjMcCVZJLNnfqnllwzlzNnzzwVNnN\ncDtZFjDjcMCDDtZFSMCvvDpmsmSRRpmmbSpdPRdTmTsp\nmmPpsbZZbbzvzgbrZRPgPMWqtHtqDnGCnMWCDwGHwtwW\ncBFBNNccsTLjJjfcjfGDGQtWwFCnCGtqCCQH\nTNsTLJlffdldzvrmbmrPzp"
letters = string.ascii_letters

total = 0
for line in input.splitlines():
    first, second = line[:len(line)//2], line[len(line)//2:]
    first = set(first)
    second = set(second)
    val = letters.find(first.intersection(second).pop())+1
    total += val


print(total)